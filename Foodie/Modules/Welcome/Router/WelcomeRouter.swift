//
//  WelcomeRouter.swift
//  WelcomeRouter
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class WelcomeRouter: WelcomeRouterProtocol {
    static func createWelcome() -> UIViewController & WelcomeViewProtocol {
        var view: UIViewController & WelcomeViewProtocol = WelcomeViewController()
        var interactor: WelcomeInteractorProtocol = WelcomeInteractor()
        var presenter: WelcomePresenterProtocol = WelcomePresenter()
        let router: WelcomeRouterProtocol = WelcomeRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        return view
    }
    func pushAuthentication(navigationController: UINavigationController?) {
        let authentication = AuthenticationRouter.createAuthentication()
        navigationController?.pushViewController(authentication, animated: true)
    }
}
