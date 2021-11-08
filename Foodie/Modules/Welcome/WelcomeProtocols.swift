//
//  WelcomeProtocols.swift
//  WelcomeProtocols
//
//  Created by Oybek on 8/9/21.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    var presenter: WelcomePresenterProtocol? {get set}
}
protocol WelcomeInteractorProtocol: AnyObject {
    var presenter: WelcomePresenterProtocol? {get set}
}
protocol WelcomePresenterProtocol: AnyObject {
    var view: WelcomeViewProtocol? {get set}
    var interactor: WelcomeInteractorProtocol? {get set}
    var router: WelcomeRouterProtocol? {get set}
    
    func showAuthentication(navigationController: UINavigationController?)
}
protocol WelcomeRouterProtocol: AnyObject {
    static func createWelcome() -> UIViewController & WelcomeViewProtocol
    func pushAuthentication(navigationController: UINavigationController?) 
}
