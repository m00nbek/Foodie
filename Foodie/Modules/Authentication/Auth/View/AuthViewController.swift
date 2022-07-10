//
//  AuthViewController.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

class AuthViewController: UIViewController, AuthViewProtocol {
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		setupButtonTargets()
		setupPageViewController()
		addKeyboardNotifications()
		
		navigationItem.hidesBackButton = true
	}
	deinit {
		removeKeyboardNotifications()
	}
	// MARK: - Properties
	var presenter: AuthPresenterProtocol?
	
	private let loginBorder: UIView = {
		let loginBorder = UIView()
		loginBorder.backgroundColor = Colors.mainOrange
		loginBorder.translatesAutoresizingMaskIntoConstraints = false
		return loginBorder
	}()
	private let signUpBorder: UIView = {
		let signUpBorder = UIView()
		signUpBorder.backgroundColor = .clear
		signUpBorder.translatesAutoresizingMaskIntoConstraints = false
		return signUpBorder
	}()
	private let logoImageView: UIImageView = {
		let iv = UIImageView()
		iv.image = Images.mainLogo
		iv.contentMode = .scaleAspectFit
		iv.translatesAutoresizingMaskIntoConstraints = false
		return iv
	}()
	private let loginButton: UIButton = {
		let button = UIButton()
		button.setTitle("Login", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 14)
		button.isUserInteractionEnabled = true
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	private let signUpButton: UIButton = {
		let button = UIButton()
		button.setTitle("Sign Up", for: .normal)
		button.titleLabel?.textAlignment = .center
		button.setTitleColor(.black, for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 14)
		button.isUserInteractionEnabled = true
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	private lazy var buttonStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [loginButton, signUpButton])
		stack.axis = .horizontal
		stack.spacing = 20
		stack.distribution = .fillEqually
		
		stack.isLayoutMarginsRelativeArrangement = true
		stack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
		
		stack.clipsToBounds = true
		stack.layer.cornerRadius = 35
		stack.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.backgroundColor = .white
		return stack
	}()
	
	// Bottom part
	var contentView: UIView = {
		let view = UIView()
		view.backgroundColor = Colors.authGrayBg
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let authPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
	private let viewControllers: [UIViewController] = [LoginRouter.createLogin(), RegisterRouter.createRegister()]
	// MARK: - Selectors
	@objc private func loginTapped() {
		UIViewPropertyAnimator.init(duration: 0.3, curve: .linear) {
			self.loginBorder.backgroundColor = Colors.mainOrange
			self.signUpBorder.backgroundColor = .clear
			self.authPageViewController.setViewControllers([self.viewControllers[0]], direction: .reverse, animated: true)
		}.startAnimation()
	}
	@objc private func signUpTapped() {
		UIViewPropertyAnimator.init(duration: 0.3, curve: .linear) {
			self.loginBorder.backgroundColor = .clear
			self.signUpBorder.backgroundColor = Colors.mainOrange
			self.authPageViewController.setViewControllers([self.viewControllers[1]], direction: .forward, animated: true)
		}.startAnimation()
	}
	// Button targets
	private func setupButtonTargets() {
		loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
		signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
	}
	// MARK: - Functions
	private func setupUI() {
		view.backgroundColor = .white
		// setup button indicator
		setupBorder(for: loginButton, with: loginBorder)
		setupBorder(for: signUpButton, with: signUpBorder)
		// subviews
		view.addSubview(logoImageView)
		view.addSubview(contentView)
		view.addSubview(buttonStack)
		// logoImageView constraints
		NSLayoutConstraint.activate([
			logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
		])
		// buttonStack constraints
		NSLayoutConstraint.activate([
			buttonStack.heightAnchor.constraint(equalToConstant: 50),
			buttonStack.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
			buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			
			buttonStack.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 35)
		])
		// contentView constraints
		NSLayoutConstraint.activate([
			contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			contentView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)
		])
	}
	private func setupPageViewController() {
		addChild(authPageViewController)
		contentView.addSubview(authPageViewController.view)
		
		authPageViewController.view.frame = contentView.bounds
		
		authPageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
		
		authPageViewController.didMove(toParent: self)
		
		authPageViewController.delegate = self
	}
	private func setupBorder(for button: UIButton, with border: UIView) {
		button.addSubview(border)
		NSLayoutConstraint.activate([
			border.heightAnchor.constraint(equalToConstant: 2),
			border.widthAnchor.constraint(equalTo: button.widthAnchor),
			border.bottomAnchor.constraint(equalTo: button.bottomAnchor)
		])
	}
	// Keyboard
	@objc private func keyboardWillChange(notification: Notification) {
		guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
			return
		}
		if notification.name == UIResponder.keyboardWillShowNotification {
			logoImageView.isHidden = true
			view.frame.origin.y = -(keyboardRect.height)
		} else {
			logoImageView.isHidden = false
			view.frame.origin.y = 0
		}
	}
	private func addKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)		
	}
	private func removeKeyboardNotifications() {
		NotificationCenter.default.removeObserver(self)
	}
	
}
// MARK: - UIPageViewControllerDelegate
extension AuthViewController: UIPageViewControllerDelegate {}
