//
//  OrdersRouter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class OrdersRouter: OrdersRouterProtocol {
    static func createOrders() -> UIViewController & OrdersViewProtocol {
        let view: UIViewController & OrdersViewProtocol = OrdersViewController()
        let interactor: OrdersInteractorProtocol = OrdersInteractor()
        let presenter: OrdersPresenterProtocol = OrdersPresenter()
        let router: OrdersRouterProtocol = OrdersRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
