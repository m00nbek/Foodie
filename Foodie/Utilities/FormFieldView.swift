//
//  FormFieldView.swift
//  FormFieldView
//
//  Created by Oybek on 8/11/21.
//

import UIKit

class FormFieldView: UIView {
    // MARK: - Properties
    typealias TextFieldType = ValidationCase
    var textFieldType: TextFieldType
    var textFieldName: String {
        switch textFieldType {
        case .email:
            return "Email"
        case .username:
            return "Username"
        case .password:
            return "Password"
        case .fullName:
            return "Full Name"
        case .address:
            return "Address"
        case .phone:
            return "Phone"
        }
    }
    let validator = ValidationService()
    var delegate: FormFieldDelegate
    let label = UILabel()
    let invalidLabel = UILabel()
    
    let textField = UITextField()
    let cancelButton = makeSymbolButton(systemName: "clear.fill", target: self, selector: #selector(cancelTapped(_:)))
    
    // MARK: - Lifecycle
    required init(textFieldType: TextFieldType, delegate: FormFieldDelegate) {
        self.textFieldType = textFieldType
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: TextFieldProperties.height)
    }
}
// MARK: - UI Functions
extension FormFieldView {
    func setup() {
        textField.delegate = self
    }
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = TextFieldProperties.backgroundColor
        layer.cornerRadius = TextFieldProperties.height / 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        // label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.text = textFieldName
        
        // invalid
        invalidLabel.translatesAutoresizingMaskIntoConstraints = false
        invalidLabel.textColor = TextFieldProperties.tintColorInValid
        invalidLabel.text = "\(textFieldName) is invalid"
        invalidLabel.font = .preferredFont(forTextStyle: .caption1)
        invalidLabel.isHidden = true
        
        // textfield
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.tintColor = TextFieldProperties.tintColorValid
        textField.isHidden = true
        switch textFieldType {
        case .email:
            textField.textContentType = .emailAddress
        case .username:
            textField.textContentType = .username
        case .password:
            textField.textContentType = .password
            textField.isSecureTextEntry = true
        case .fullName:
            textField.textContentType = .name
        case .address:
            textField.textContentType = .fullStreetAddress
        case .phone:
            textField.text = "+"
            textField.textContentType = .telephoneNumber
            textField.keyboardType = .numberPad
        }
        // button
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.imageView?.tintColor = TextFieldProperties.foregroundColor
        cancelButton.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_: )))
        addGestureRecognizer(tap)
    }
    func layout() {
        addSubview(label)
        addSubview(invalidLabel)
        addSubview(textField)
        addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            // label
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            // invalidLabel
            invalidLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            invalidLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            // textfield
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 2),
            // button
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: cancelButton.trailingAnchor, multiplier: 2),
        ])
    }
    @objc func tapped(_ recognizer: UITapGestureRecognizer) {
        if(recognizer.state == UIGestureRecognizer.State.ended) {
            animteTextField()
        }
    }
}
// MARK: - Animations
extension FormFieldView {
    func animteTextField() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1,
                                                       delay: 0,
                                                       options: []) {
            // style
            self.backgroundColor = .white
            self.label.textColor = TextFieldProperties.tintColorValid
            self.layer.borderWidth = 1
            self.layer.borderColor = self.label.textColor.cgColor
            self.textField.tintColor = TextFieldProperties.tintColorValid
            
            // move
            let transpose = CGAffineTransform(translationX: -8, y: -24)
            let scale = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.label.transform = transpose.concatenating(scale)
            
        } completion: { position in
            self.textField.isHidden = false
            self.textField.becomeFirstResponder()
            
            self.cancelButton.isHidden = false
        }
    }
    func updateTextField(isValid: Bool) {
        if isValid {
            label.isHidden = false
            invalidLabel.isHidden = true
            layer.borderColor = TextFieldProperties.tintColorValid.cgColor
            textField.tintColor = TextFieldProperties.tintColorValid
        } else {
            label.isHidden = true
            invalidLabel.isHidden = false
            layer.borderColor = TextFieldProperties.tintColorInValid.cgColor
            textField.tintColor = TextFieldProperties.tintColorInValid
        }
    }
}
// MARK: - UITextFieldDelegate
extension FormFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animteTextField()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate.textFieldShouldReturn(textView: self)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        return false
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        guard !text.isEmpty else {
            updateTextField(isValid: false)
            invalidLabel.text = "This field is required!"
            return
        }
        validator.validate(textFieldType, for: text) ? updateTextField(isValid: true) : updateTextField(isValid: false)
    }
}
// MARK: - Actions
extension FormFieldView {
    func undo() {
        UIViewPropertyAnimator(duration: 0.1, curve: .linear) {
            // style
            self.backgroundColor = TextFieldProperties.backgroundColor
            self.label.textColor = TextFieldProperties.foregroundColor
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.black.cgColor
            // visibility
            self.label.isHidden = false
            self.invalidLabel.isHidden = true
            self.textField.isHidden = true
            self.textField.text = ""
            self.cancelButton.isHidden = true
            // move
            self.label.transform = .identity
        }.startAnimation()
    }
    @objc func cancelTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        undo()
    }
}
// MARK: - Factories
func makeSymbolButton(systemName: String, target: Any, selector: Selector) -> UIButton {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: systemName, withConfiguration: configuration)
    
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(target, action: selector, for: .primaryActionTriggered)
    button.setImage(image, for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    
    return button
}
// MARK: - Delegate
protocol FormFieldDelegate {
    func textFieldShouldReturn(textView: FormFieldView)
}
// MARK: - TextFieldProperties
private struct TextFieldProperties {
    static let height: CGFloat = 60
    static let tintColorValid: UIColor = .systemGreen
    static let tintColorInValid: UIColor = .systemRed
    static let backgroundColor: UIColor = .white
    static let foregroundColor: UIColor = .systemGray
}
