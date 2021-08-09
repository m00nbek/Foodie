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
    }
    // MARK: - Properties
    var presenter: WelcomePresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {

    }
}
