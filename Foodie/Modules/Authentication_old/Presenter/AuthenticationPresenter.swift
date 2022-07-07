//
//  AuthenticationPresenter.swift
//  AuthenticationPresenter
//
//  Created by Oybek on 8/10/21.
//

import Foundation

class AuthenticationPresenter: AuthenticationPresenterProtocol {
    weak var view: AuthenticationViewProtocol?
	var interactor: AuthenticationInteractorProtocol?
    var router: AuthenticationRouterProtocol?
}