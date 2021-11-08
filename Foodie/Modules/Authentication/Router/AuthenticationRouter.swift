//
//  AuthenticationRouter.swift
//  AuthenticationRouter
//
//  Created by Oybek on 8/10/21.
//

import UIKit

class AuthenticationRouter: AuthenticationRouterProtocol {
    
    static func createAuthentication() -> UIViewController & AuthenticationViewProtocol {
        let view: UIViewController & AuthenticationViewProtocol = AuthenticationViewController()
        let interactor: AuthenticationInteractorProtocol = AuthenticationInteractor()
        let presenter: AuthenticationPresenterProtocol = AuthenticationPresenter()
        let router: AuthenticationRouterProtocol = AuthenticationRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
