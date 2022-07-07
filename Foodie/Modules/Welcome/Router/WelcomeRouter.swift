//
//  WelcomeRouter.swift
//  WelcomeRouter
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class WelcomeRouter: WelcomeRouterProtocol {
    static func createWelcome() -> UIViewController & WelcomeViewProtocol {
        let view: UIViewController & WelcomeViewProtocol = WelcomeViewController()
        let interactor: WelcomeInteractorProtocol = WelcomeInteractor()
        let presenter: WelcomePresenterProtocol = WelcomePresenter()
        let router: WelcomeRouterProtocol = WelcomeRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        return view
    }
    func pushAuthentication(navigationController: UINavigationController?) {
        let auth = AuthRouter.createAuth()
        navigationController?.pushViewController(auth, animated: true)
    }
}
