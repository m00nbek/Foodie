//
//  HomeRouter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    static func createHome() -> UIViewController & HomeViewProtocol {
        var view: UIViewController & HomeViewProtocol = HomeViewController()
        var interactor: HomeInteractorProtocol = HomeInteractor()
        var presenter: HomePresenterProtocol = HomePresenter()
        let router: HomeRouterProtocol = HomeRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
