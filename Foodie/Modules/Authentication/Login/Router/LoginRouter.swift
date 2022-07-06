//
//  LoginRouter.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
	static func createLogin() -> UIViewController & LoginViewProtocol {
		let view: UIViewController & LoginViewProtocol = LoginViewController()
		let interactor: LoginInteractorProtocol = LoginInteractor()
		let presenter: LoginPresenterProtocol = LoginPresenter()
		let router: LoginRouterProtocol = LoginRouter()
		
		view.presenter = presenter
		
		interactor.presenter = presenter
		
		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		
		return view
	}
}
