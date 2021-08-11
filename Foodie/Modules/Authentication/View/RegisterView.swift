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
        let nameTextView = FormFieldView()
        nameTextView.textFieldName = "Full Name"
        nameTextView.delegate = self
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let emailTextView = FormFieldView()
        emailTextView.textFieldName = "Email"
        emailTextView.delegate = self
        emailTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let passwordTextView = FormFieldView()
        passwordTextView.textFieldName = "Password"
        passwordTextView.delegate = self
        passwordTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let addressTextView = FormFieldView()
        addressTextView.textFieldName = "Address"
        addressTextView.delegate = self
        addressTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let stack = UIStackView(arrangedSubviews: [nameTextView, emailTextView, passwordTextView])
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
// MARK: -
extension RegisterView: TextFieldProtocol {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField.text)
    }
    
}
