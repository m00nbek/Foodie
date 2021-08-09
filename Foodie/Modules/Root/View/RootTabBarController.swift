//
//  RootTabBarController.swift
//  RootTabBarController
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class RootTabBarController: UITabBarController, RootViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.presentWelcome(in: self)
    }
    // MARK: - Properties
    var presenter: RootPresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {
        view.backgroundColor = .white
    }
}
