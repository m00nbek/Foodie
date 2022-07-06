//
//  OrdersPresenter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import Foundation

class OrdersPresenter: OrdersPresenterProtocol {
    weak var view: OrdersViewProtocol?
    var interactor: OrdersInteractorProtocol?
    var router: OrdersRouterProtocol?
}
