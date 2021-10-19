//
//  OrdersRouter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class OrdersRouter: OrdersRouterProtocol {
    static func createOrders() -> UIViewController & OrdersViewProtocol {
        var view: UIViewController & OrdersViewProtocol = OrdersViewController()
        var interactor: OrdersInteractorProtocol = OrdersInteractor()
        var presenter: OrdersPresenterProtocol = OrdersPresenter()
        let router: OrdersRouterProtocol = OrdersRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
