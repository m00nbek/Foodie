//
//  WishlistPresenter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import Foundation

class WishlistPresenter: WishlistPresenterProtocol {
    weak var view: WishlistViewProtocol?
    weak var interactor: WishlistInteractorProtocol?
    weak var router: WishlistRouterProtocol?
}
