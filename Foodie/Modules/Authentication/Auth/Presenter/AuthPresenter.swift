//
//  AuthPresenter.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import Foundation

class AuthPresenter: AuthPresenterProtocol {
	weak var view: AuthViewProtocol?
	var interactor: AuthInteractorProtocol?
	var router: AuthRouterProtocol?
}
