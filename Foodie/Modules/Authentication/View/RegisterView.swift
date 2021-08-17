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
}
// MARK: - FormFieldDelegate
extension RegisterView: FormFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textFieldShouldReturn(textView: FormFieldView) {
        switch textView {
        case fullNameTextView:
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
