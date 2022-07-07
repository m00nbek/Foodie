//
//  RegisterViewController.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewProtocol {
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		setupButtonTargets()
	}
	// MARK: - Properties
	var presenter: RegisterPresenterProtocol?
	// TextViews
	private lazy var fullNameTextView = FormFieldView(textFieldType: .fullName, delegate: self)
	private lazy var emailTextView = FormFieldView(textFieldType: .email, delegate: self)
	private lazy var passwordTextView = FormFieldView(textFieldType: .password, delegate: self)
	private lazy var addressTextView = FormFieldView(textFieldType: .address, delegate: self)
	private let registerButton: UIButton = {
		let button = UIButton()
		button.setTitle("Register", for: .normal)
		button.titleLabel?.textColor = .white
		button.backgroundColor = Constants.mainOrange
		button.layer.cornerRadius = 60 / 2
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	// MARK: - Selectors
	
	// Button targets
	private func setupButtonTargets() {
		
	}
	// MARK: - Functions
	private func setupUI() {
		// style
		view.backgroundColor = Constants.authGrayBg
		// setup text views
		let textViewStack = setupTextViews()
		// subviews
		view.addSubview(textViewStack)
		view.addSubview(registerButton)
		// constraints
		NSLayoutConstraint.activate([
			textViewStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
			textViewStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			textViewStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
		])
		NSLayoutConstraint.activate([
			registerButton.heightAnchor.constraint(equalToConstant: 60),
			registerButton.topAnchor.constraint(equalTo: textViewStack.bottomAnchor, constant: 20),
			registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
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
extension RegisterViewController: FormFieldDelegate {
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

