//
//  OrdersProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol OrdersViewProtocol: AnyObject {
    var presenter: OrdersPresenterProtocol? {get set}
}
protocol OrdersInteractorProtocol: AnyObject {
    var presenter: OrdersPresenterProtocol? {get set}
}
protocol OrdersPresenterProtocol: AnyObject {
    var view: OrdersViewProtocol? {get set}
    var interactor: OrdersInteractorProtocol? {get set}
    var router: OrdersRouterProtocol? {get set}
}
protocol OrdersRouterProtocol: AnyObject {
    static func createOrders() -> UIViewController & OrdersViewProtocol
}

