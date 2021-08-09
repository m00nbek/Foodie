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
    // MARK: - Properties
    var presenter: RootPresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {
        
    }
}
