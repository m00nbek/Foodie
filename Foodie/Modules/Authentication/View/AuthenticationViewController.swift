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
    }
    // MARK: - Properties
    var presenter: AuthenticationPresenterProtocol?
    private lazy var loginBorder: UIView = {
        let loginBorder = UIView()
        loginBorder.backgroundColor = UIColor(named: "mainOrange")
        loginBorder.translatesAutoresizingMaskIntoConstraints = false
        return loginBorder
    }()
    private lazy var signUpBorder: UIView = {
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
    private lazy var sixtyPercentHeight = (60/100) * view.frame.height
    private let loginView = LoginView()
    private let registerView = RegisterView()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: sixtyPercentHeight)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: sixtyPercentHeight)
        }
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private lazy var views = [loginView, registerView]
    // MARK: - Selectors
    @objc private func loginTapped() {
        loginBorder.backgroundColor = UIColor(named: "mainOrange")
        signUpBorder.backgroundColor = .clear
    }
    @objc private func signUpTapped() {
        loginBorder.backgroundColor = .clear
        signUpBorder.backgroundColor = UIColor(named: "mainOrange")
    }
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {
        view.backgroundColor = .white
        // setup button indicator
        loginButton.addSubview(loginBorder)
        NSLayoutConstraint.activate([
            loginBorder.heightAnchor.constraint(equalToConstant: 2),
            loginBorder.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            loginBorder.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor)
        ])
        signUpButton.addSubview(signUpBorder)
        NSLayoutConstraint.activate([
            signUpBorder.heightAnchor.constraint(equalToConstant: 2),
            signUpBorder.widthAnchor.constraint(equalTo: signUpButton.widthAnchor),
            signUpBorder.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor)
        ])
        // constraints
        logoImageView.heightAnchor.constraint(equalToConstant: (view.frame.height/4) - 50).isActive = true
        view.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        scrollView.heightAnchor.constraint(equalToConstant: sixtyPercentHeight).isActive = true
        view.addSubview(scrollView)
        
        buttonStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(buttonStack)
        buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: -30).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
}
// MARK: - UIScrollViewDelegate
extension AuthenticationViewController: UIScrollViewDelegate {
}

