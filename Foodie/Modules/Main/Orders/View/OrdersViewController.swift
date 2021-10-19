//
//  OrdersViewController.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class OrdersViewController: UIViewController, OrdersViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Properties
    var presenter: OrdersPresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {

    }
}
