//
//  RootRouter.swift
//  RootRouter
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class RootRouter: RootRouterProtocol {
    
    static func createRoot() -> UITabBarController & RootViewProtocol {
        let view: UITabBarController & RootViewProtocol = RootTabBarController()
        let interactor: RootInteractorProtocol = RootInteractor()
        let presenter: RootPresenterProtocol = RootPresenter()
        let router: RootRouterProtocol = RootRouter()
    
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        return view
    }
    func presentWelcome(in view: UIViewController?) {
        let welcomeVC = WelcomeRouter.createWelcome()
        let nav = UINavigationController(rootViewController: welcomeVC)
        nav.modalPresentationStyle = .fullScreen
        view?.present(nav, animated: true)
    }
}
