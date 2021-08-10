//
//  AuthenticationRouter.swift
//  AuthenticationRouter
//
//  Created by Oybek on 8/10/21.
//

import UIKit

class AuthenticationRouter: AuthenticationRouterProtocol {
    
    static func createAuthentication() -> UIViewController & AuthenticationViewProtocol {
        var view: UIViewController & AuthenticationViewProtocol = AuthenticationViewController()
        var interactor: AuthenticationInteractorProtocol = AuthenticationInteractor()
        var presenter: AuthenticationPresenterProtocol = AuthenticationPresenter()
        let router: AuthenticationRouterProtocol = AuthenticationRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
