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
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {

    }
}
