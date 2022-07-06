//
//  HomeViewController.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {

    }
}
