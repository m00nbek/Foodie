//
//  WishlistPresenter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import Foundation

class WishlistPresenter: WishlistPresenterProtocol {
    weak var view: WishlistViewProtocol?
    var interactor: WishlistInteractorProtocol?
    var router: WishlistRouterProtocol?
}
