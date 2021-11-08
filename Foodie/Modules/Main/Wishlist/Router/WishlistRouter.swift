//
//  WishlistRouter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class WishlistRouter: WishlistRouterProtocol {
    static func createWishlist() -> UIViewController & WishlistViewProtocol {
        let view: UIViewController & WishlistViewProtocol = WishlistViewController()
        let interactor: WishlistInteractorProtocol = WishlistInteractor()
        let presenter: WishlistPresenterProtocol = WishlistPresenter()
        let router: WishlistRouterProtocol = WishlistRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
