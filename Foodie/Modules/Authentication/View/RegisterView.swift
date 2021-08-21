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
    // TextViews
    private lazy var fullNameTextView = FormFieldView(textFieldType: .fullName, delegate: self)
    private lazy var emailTextView = FormFieldView(textFieldType: .email, delegate: self)
    private lazy var passwordTextView = FormFieldView(textFieldType: .password, delegate: self)
    private lazy var addressTextView = FormFieldView(textFieldType: .address, delegate: self)
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(named: "mainOrange")
        button.layer.cornerRadius = 60 / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // MARK: - Functions
    private func setupUI() {
        // style
        backgroundColor = .systemGray5
        // setup text views
        let textViewStack = setupTextViews()
        // subviews
        addSubview(textViewStack)
        addSubview(registerButton)
        // constraints
        NSLayoutConstraint.activate([
            textViewStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            textViewStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textViewStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            registerButton.heightAnchor.constraint(equalToConstant: 60),
            registerButton.topAnchor.constraint(equalTo: textViewStack.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    private func setupTextViews() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [fullNameTextView, emailTextView, passwordTextView, addressTextView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
// MARK: - FormFieldDelegate
extension RegisterView: FormFieldDelegate {
    func textFieldShouldReturn(textView: FormFieldView) {
        switch textView {
        case fullNameTextView:
            emailTextView.textField.becomeFirstResponder()
        case emailTextView:
            passwordTextView.textField.becomeFirstResponder()
        case passwordTextView:
            addressTextView.textField.becomeFirstResponder()
        default:
            addressTextView.textField.resignFirstResponder()
            registerButton.becomeFirstResponder()
        }
    }
}
