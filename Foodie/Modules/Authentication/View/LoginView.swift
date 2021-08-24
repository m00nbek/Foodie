//
//  loginView.swift
//  loginView
//
//  Created by Oybek on 7/31/21.
//

import UIKit

class LoginView: UIView {
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
    private lazy var emailTextView = FormFieldView(textFieldType: .email, delegate: self)
    private lazy var passwordTextView = FormFieldView(textFieldType: .password, delegate: self)
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = Constants.mainOrange
        button.layer.cornerRadius = 60 / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let forgotPasscodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot passcode?", for: .normal)
        button.setTitleColor(Constants.mainOrange, for: .normal)
        button.isUserInteractionEnabled = true
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
        addSubview(forgotPasscodeButton)
        addSubview(loginButton)
        // constraints
        NSLayoutConstraint.activate([
            textViewStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            textViewStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textViewStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            forgotPasscodeButton.heightAnchor.constraint(equalToConstant: 20),
            forgotPasscodeButton.topAnchor.constraint(equalTo: textViewStack.bottomAnchor, constant: 20),
            forgotPasscodeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    private func setupTextViews() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [emailTextView, passwordTextView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
// MARK: - FormFieldDelegate
extension LoginView: FormFieldDelegate {
    func textFieldShouldReturn(textView: FormFieldView) {
        switch textView {
        case emailTextView:
            passwordTextView.textField.becomeFirstResponder()
        default:
            passwordTextView.textField.resignFirstResponder()
            loginButton.becomeFirstResponder()
        }
    }
}

