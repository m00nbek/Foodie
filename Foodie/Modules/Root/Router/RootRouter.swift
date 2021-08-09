//
//  RootRouter.swift
//  RootRouter
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class RootRouter: RootRouterProtocol {
    func createRoot() -> UITabBarController & RootViewProtocol {
        var view: UITabBarController & RootViewProtocol = RootTabBarController()
        var interactor: RootInteractorProtocol = RootInteractor()
        var presenter: RootPresenterProtocol = RootPresenter()
        let router: RootRouterProtocol = RootRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
