//
//  RegisterRouter.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

class RegisterRouter: RegisterRouterProtocol {
	static func createRegister() -> UIViewController & RegisterViewProtocol {
		let view: UIViewController & RegisterViewProtocol = RegisterViewController()
		let interactor: RegisterInteractorProtocol = RegisterInteractor()
		let presenter: RegisterPresenterProtocol = RegisterPresenter()
		let router: RegisterRouterProtocol = RegisterRouter()
		
		view.presenter = presenter
		
		interactor.presenter = presenter
		
		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		
		return view
	}
}
