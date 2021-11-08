//
//  HomeRouter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    static func createHome() -> UIViewController & HomeViewProtocol {
        let view: UIViewController & HomeViewProtocol = HomeViewController()
        let interactor: HomeInteractorProtocol = HomeInteractor()
        let presenter: HomePresenterProtocol = HomePresenter()
        let router: HomeRouterProtocol = HomeRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
