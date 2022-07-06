//
//  AuthRouter.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

class AuthRouter: AuthRouterProtocol {
	static func createAuth() -> UIViewController & AuthViewProtocol {
		let view: UIViewController & AuthViewProtocol = AuthViewController()
		let interactor: AuthInteractorProtocol = AuthInteractor()
		let presenter: AuthPresenterProtocol = AuthPresenter()
		let router: AuthRouterProtocol = AuthRouter()
		
		view.presenter = presenter
		
		interactor.presenter = presenter
		
		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		
		return view
	}
}
