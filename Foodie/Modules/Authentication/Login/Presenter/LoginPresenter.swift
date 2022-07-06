//
//  LoginPresenter.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
	weak var view: LoginViewProtocol?
	var interactor: LoginInteractorProtocol?
	var router: LoginRouterProtocol?
}
