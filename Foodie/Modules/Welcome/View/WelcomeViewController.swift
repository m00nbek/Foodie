//
//  WelcomeViewController.swift
//  WelcomeViewController
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class WelcomeViewController: UIViewController, WelcomeViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.layer.insertSublayer(gradient, at: 3)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = view.frame
    }
    // MARK: - Properties
    var presenter: WelcomePresenterProtocol?
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = .init(x: 0.5, y: 0.5)
        gradient.colors = [UIColor.clear.cgColor,
                           UIColor(named: "gradientOrange")!.cgColor,
                           UIColor(named: "mainOrange")!.cgColor]
        return gradient
    }()
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 60 / 2
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let foodLabel: UILabel = {
        let label = UILabel()
        label.text = "Food for \nEveryone"
        label.font = .systemFont(ofSize: 65)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let toyImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "toy")
        iv.backgroundColor = .clear
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get started", for: .normal)
        button.setTitleColor(UIColor(named: "mainOrange"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    // MARK: - Selectors
    @objc private func getStarted() {
        // show Authentication
        presenter?.showAuthentication(navigationController: navigationController)
    }
    // MARK: - Functions
    private func setupUI() {
        view.backgroundColor = UIColor(named: "mainOrange")
        
        view.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        
        view.addSubview(foodLabel)
        foodLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10).isActive = true
        foodLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        foodLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        view.addSubview(toyImageView)
        toyImageView.topAnchor.constraint(equalTo: foodLabel.bottomAnchor, constant: 20).isActive = true
        toyImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toyImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(getStartedButton)
        getStartedButton.topAnchor.constraint(equalTo: toyImageView.bottomAnchor, constant: 10).isActive = true
        getStartedButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        getStartedButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}
