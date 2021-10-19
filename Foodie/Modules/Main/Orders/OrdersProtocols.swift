//
//  OrdersProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol OrdersViewProtocol {
    var presenter: OrdersPresenterProtocol? {get set}
}
protocol OrdersInteractorProtocol {
    var presenter: OrdersPresenterProtocol? {get set}
}
protocol OrdersPresenterProtocol {
    var view: OrdersViewProtocol? {get set}
    var interactor: OrdersInteractorProtocol? {get set}
    var router: OrdersRouterProtocol? {get set}
}
protocol OrdersRouterProtocol {
    static func createOrders() -> UIViewController & OrdersViewProtocol
}

