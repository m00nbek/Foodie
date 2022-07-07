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
	}
	// MARK: - Properties
	var presenter: AuthPresenterProtocol?
	
	private let loginBorder: UIView = {
		let loginBorder = UIView()
		loginBorder.backgroundColor = Constants.mainOrange
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
		iv.image = UIImage(named: "logo")
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
		view.backgroundColor = .red
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private let authPageViewController: UIPageViewController = {
		let pvc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal)
		pvc.view.translatesAutoresizingMaskIntoConstraints = false
		return pvc
	}()
	private let viewControllers: [UIViewController] = [LoginRouter.createLogin(), RegisterRouter.createRegister()]
	
	// MARK: - Selectors
	@objc private func loginTapped() {
		UIViewPropertyAnimator.init(duration: 0.3, curve: .linear) {
			self.loginBorder.backgroundColor = Constants.mainOrange
			self.signUpBorder.backgroundColor = .clear
		}.startAnimation()
	}
	@objc private func signUpTapped() {
		UIViewPropertyAnimator.init(duration: 0.3, curve: .linear) {
			self.loginBorder.backgroundColor = .clear
			self.signUpBorder.backgroundColor = Constants.mainOrange
		}.startAnimation()
	}
	
	// Button targets
	private func setupButtonTargets() {
		loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
		signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
	}
	private func setupPageViewController() {
		
		self.addChild(authPageViewController)
		self.contentView.addSubview(authPageViewController.view)
		
		authPageViewController.view.frame = contentView.bounds
		
		authPageViewController.setViewControllers(viewControllers, direction: .forward, animated: true)
		
		authPageViewController.didMove(toParent: self)
		
		authPageViewController.delegate = self
	}
	// MARK: - Functions
	private func setupUI() {
		view.backgroundColor = .white
		// setup button indicator
		setupBorder(for: loginButton, with: loginBorder)
		setupBorder(for: signUpButton, with: signUpBorder)
		// subviews
		view.addSubview(logoImageView)
		view.addSubview(buttonStack)
		view.addSubview(contentView)
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
			buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])
		// contentView constraints
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
			contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			
			contentView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)
		])
	}
	private func setupBorder(for button: UIButton, with border: UIView) {
		button.addSubview(border)
		NSLayoutConstraint.activate([
			border.heightAnchor.constraint(equalToConstant: 2),
			border.widthAnchor.constraint(equalTo: button.widthAnchor),
			border.bottomAnchor.constraint(equalTo: button.bottomAnchor)
		])
	}
}

extension AuthViewController: UIPageViewControllerDelegate {
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let index = viewControllers.firstIndex(of: viewController), index > 0 else {
			return nil
		}
		let before = index - 1
		return viewControllers[before]
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let index = viewControllers.firstIndex(of: viewController), index < (viewControllers.count - 1) else {
			return nil
		}
		let after = index + 1
		return viewControllers[after]
	}

}
