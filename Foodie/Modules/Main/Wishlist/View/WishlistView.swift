//
//  WishlistView.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class WishlistViewController: UIViewController, WishlistViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Properties
    var presenter: WishlistPresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {

    }
}

