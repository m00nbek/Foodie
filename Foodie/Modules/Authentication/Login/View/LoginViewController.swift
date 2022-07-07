//
//  LoginViewController.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		setupButtonTargets()
	}
	// MARK: - Properties
	var presenter: LoginPresenterProtocol?
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
		view.addSubview(forgotPasscodeButton)
		view.addSubview(loginButton)
		// constraints
		NSLayoutConstraint.activate([
			textViewStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
			textViewStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			textViewStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
		])
		NSLayoutConstraint.activate([
			forgotPasscodeButton.heightAnchor.constraint(equalToConstant: 20),
			forgotPasscodeButton.topAnchor.constraint(equalTo: textViewStack.bottomAnchor, constant: 20),
			forgotPasscodeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
		])
		NSLayoutConstraint.activate([
			loginButton.heightAnchor.constraint(equalToConstant: 60),
			loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
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
extension LoginViewController: FormFieldDelegate {
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
