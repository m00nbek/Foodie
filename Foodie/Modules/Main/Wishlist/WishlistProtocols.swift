//
//  WishlistProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol WishlistViewProtocol {
    var presenter: WishlistPresenterProtocol? {get set}
}
protocol WishlistInteractorProtocol {
    var presenter: WishlistPresenterProtocol? {get set}
}
protocol WishlistPresenterProtocol {
    var view: WishlistViewProtocol? {get set}
    var interactor: WishlistInteractorProtocol? {get set}
    var router: WishlistRouterProtocol? {get set}
}
protocol WishlistRouterProtocol {
    static func createWishlist() -> UIViewController & WishlistViewProtocol
}
