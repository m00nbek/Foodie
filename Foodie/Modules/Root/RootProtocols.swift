//
//  RootProtocols.swift
//  RootProtocols
//
//  Created by Oybek on 8/9/21.
//

import UIKit

protocol RootViewProtocol {
    var presenter: RootPresenterProtocol? {get set}
}
protocol RootInteractorProtocol {
    var presenter: RootPresenterProtocol? {get set}
}
protocol RootPresenterProtocol {
    var view: RootViewProtocol? {get set}
    var interactor: RootInteractorProtocol? {get set}
    var router: RootRouterProtocol? {get set}
}
protocol RootRouterProtocol {
    func createRoot() -> UITabBarController & RootViewProtocol
}
