//
//  RootProtocols.swift
//  RootProtocols
//
//  Created by Oybek on 8/9/21.
//

import UIKit

protocol RootViewProtocol: AnyObject {
    var presenter: RootPresenterProtocol? {get set}
}
protocol RootInteractorProtocol: AnyObject {
    var presenter: RootPresenterProtocol? {get set}
    
    func isLoggedIn() -> Bool
}
protocol RootPresenterProtocol: AnyObject {
    var view: RootViewProtocol? {get set}
    var interactor: RootInteractorProtocol? {get set}
    var router: RootRouterProtocol? {get set}
    
    func presentWelcome(in view: UIViewController?)
}
protocol RootRouterProtocol: AnyObject {
    static func createRoot() -> UITabBarController & RootViewProtocol
    func presentWelcome(in view: UIViewController?)
}
