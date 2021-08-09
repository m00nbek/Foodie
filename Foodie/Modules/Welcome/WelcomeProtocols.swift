//
//  WelcomeProtocols.swift
//  WelcomeProtocols
//
//  Created by Oybek on 8/9/21.
//

import UIKit

protocol WelcomeViewProtocol {
    var presenter: WelcomePresenterProtocol? {get set}
}
protocol WelcomeInteractorProtocol {
    var presenter: WelcomePresenterProtocol? {get set}
}
protocol WelcomePresenterProtocol {
    var view: WelcomeViewProtocol? {get set}
    var interactor: WelcomeInteractorProtocol? {get set}
    var router: WelcomeRouterProtocol? {get set}
}
protocol WelcomeRouterProtocol {
    func createWelcome() -> UIViewController & WelcomeViewProtocol
}
