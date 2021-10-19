//
//  ProfileViewController.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Properties
    var presenter: ProfilePresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {

    }
}
