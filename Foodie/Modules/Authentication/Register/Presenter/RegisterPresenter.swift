//
//  RegisterPresenter.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import Foundation

class RegisterPresenter: RegisterPresenterProtocol {
	weak var view: RegisterViewProtocol?
	var interactor: RegisterInteractorProtocol?
	var router: RegisterRouterProtocol?
}
