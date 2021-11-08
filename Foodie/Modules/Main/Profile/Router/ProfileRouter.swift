//
//  ProfileRouter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class ProfileRouter: ProfileRouterProtocol {
    static func createProfile() -> UIViewController & ProfileViewProtocol {
        let view: UIViewController & ProfileViewProtocol = ProfileViewController()
        let interactor: ProfileInteractorProtocol = ProfileInteractor()
        let presenter: ProfilePresenterProtocol = ProfilePresenter()
        let router: ProfileRouterProtocol = ProfileRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
