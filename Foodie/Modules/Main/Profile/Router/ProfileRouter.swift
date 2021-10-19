//
//  ProfileRouter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class ProfileRouter: ProfileRouterProtocol {
    static func createProfile() -> UIViewController & ProfileViewProtocol {
        var view: UIViewController & ProfileViewProtocol = ProfileViewController()
        var interactor: ProfileInteractorProtocol = ProfileInteractor()
        var presenter: ProfilePresenterProtocol = ProfilePresenter()
        let router: ProfileRouterProtocol = ProfileRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
