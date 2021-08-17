//
//  AuthenticationViewController.swift
//  AuthenticationViewController
//
//  Created by Oybek on 8/10/21.
//

import UIKit

class AuthenticationViewController: UIViewController, AuthenticationViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addKeyboardNotifications()
    }
    deinit {
        removeKeyboardNotifications()
    }
    // MARK: - Properties
    var presenter: AuthenticationPresenterProtocol?
    private let loginBorder: UIView = {
        let loginBorder = UIView()
        loginBorder.backgroundColor = UIColor(named: "mainOrange")
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
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var sixtyPercentHeight = (60/100) * view.frame.height
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
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: sixtyPercentHeight)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: sixtyPercentHeight)
        }
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private lazy var loginView = LoginView()
    private lazy var registerView = RegisterView()
    private lazy var views = [loginView, registerView]
    // MARK: - Selectors
    @objc private func loginTapped() {
        UIViewPropertyAnimator.init(duration: 0.3, curve: .linear) {
            self.loginBorder.backgroundColor = UIColor(named: "mainOrange")
            self.signUpBorder.backgroundColor = .clear
            self.scrollToView(self.loginView)
        }.startAnimation()
    }
    @objc private func signUpTapped() {
        UIViewPropertyAnimator.init(duration: 0.3, curve: .linear) {
            self.loginBorder.backgroundColor = .clear
            self.signUpBorder.backgroundColor = UIColor(named: "mainOrange")
            self.scrollToView(self.registerView)
        }.startAnimation()
    }
    @objc private func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            logoImageView.isHidden = true
            view.frame.origin.y = -(keyboardRect.height-100)
        } else {
            logoImageView.isHidden = false
            view.frame.origin.y = 0
        }
    }
    // MARK: - Functions
    private func setupUI() {
        view.backgroundColor = .white
        // setup button indicator
        setupBorder(for: loginButton, with: loginBorder)
        setupBorder(for: signUpButton, with: signUpBorder)
        // subviews
        view.addSubview(scrollView)
        view.addSubview(logoImageView)
        view.addSubview(buttonStack)
        // logoImageView constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        // buttonStack constraints
        NSLayoutConstraint.activate([
            buttonStack.heightAnchor.constraint(equalToConstant: 50),
            buttonStack.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        // scrollView constraints
        NSLayoutConstraint.activate([
            scrollView.heightAnchor.constraint(equalToConstant: sixtyPercentHeight),
            scrollView.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: -30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
    private func scrollToView(_ view: UIView) {
        scrollView.setContentOffset(CGPoint(x: view.frame.minX, y: view.frame.minY), animated: true)
    }
    private func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
}
// MARK: - UIScrollViewDelegate
extension AuthenticationViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if signUpBorder.backgroundColor == .clear {
            signUpTapped()
        } else {
            loginTapped()
        }
    }
}
