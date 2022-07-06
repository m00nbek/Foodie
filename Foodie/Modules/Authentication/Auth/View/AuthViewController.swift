//
//  AuthViewController.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

class AuthViewController: UIViewController, AuthViewProtocol {
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		setupButtonTargets()
	}
	// MARK: - Properties
	var presenter: AuthPresenterProtocol?
	// MARK: - Selectors
	
	// Button targets
	private func setupButtonTargets() {
		
	}
	// MARK: - Functions
	private func setupUI() {
		
	}
}
