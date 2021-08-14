//
//  RegisterView.swift
//  RegisterView
//
//  Created by Oybek on 7/31/21.
//

import UIKit

class RegisterView: UIView {
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Properties
    var animationDelegate: Animation?
    // TextViews
    private lazy var fullNameTextView = createTextView(with: "Full Name", for: self)
    private lazy var emailTextView = createTextView(with: "Email", for: self)
    private lazy var passwordTextView = createTextView(with: "Password", for: self)
    private lazy var addressTextView = createTextView(with: "Address", for: self)
    // MARK: - Functions
    private func setupUI() {
        // style
        backgroundColor = .systemGray5
        // setup text views
        setupTextViews()
        // subviews
        // constraints
    }
    private func setupTextViews() {
        let stack = UIStackView(arrangedSubviews: [fullNameTextView, emailTextView, passwordTextView, addressTextView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    private func createTextView(with name: String, for view: TextFieldProtocol) -> FormFieldView {
        let textView = FormFieldView()
        textView.delegate = view
        textView.textFieldName = name
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }
}
// MARK: - TextFieldProtocol
extension RegisterView: TextFieldProtocol {
    func textFieldDidChangeSelection(_ textField: UITextField) {
    }
    func textFieldShouldReturn(textView: FormFieldView) {
        switch textView {
        case fullNameTextView:
            animationDelegate?.changeHeight(percent: 80)
            emailTextView.textField.becomeFirstResponder()
        case emailTextView:
            passwordTextView.textField.becomeFirstResponder()
        case passwordTextView:
            addressTextView.textField.becomeFirstResponder()
        default:
            // register button becomeFirstResponder
            print("button becomeFirstResponder")
        }
    }
}
