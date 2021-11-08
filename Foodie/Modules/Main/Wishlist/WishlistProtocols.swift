//
//  WishlistProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol WishlistViewProtocol: AnyObject {
    var presenter: WishlistPresenterProtocol? {get set}
}
protocol WishlistInteractorProtocol: AnyObject {
    var presenter: WishlistPresenterProtocol? {get set}
}
protocol WishlistPresenterProtocol: AnyObject {
    var view: WishlistViewProtocol? {get set}
    var interactor: WishlistInteractorProtocol? {get set}
    var router: WishlistRouterProtocol? {get set}
}
protocol WishlistRouterProtocol: AnyObject {
    static func createWishlist() -> UIViewController & WishlistViewProtocol
}
