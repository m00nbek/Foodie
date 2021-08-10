//
//  AuthenticationProtocols.swift
//  AuthenticationProtocols
//
//  Created by Oybek on 8/10/21.
//

import UIKit

protocol AuthenticationViewProtocol {
    var presenter: AuthenticationPresenterProtocol? {get set}
}
protocol AuthenticationInteractorProtocol {
    var presenter: AuthenticationPresenterProtocol? {get set}
}
protocol AuthenticationPresenterProtocol {
    var view: AuthenticationViewProtocol? {get set}
    var interactor: AuthenticationInteractorProtocol? {get set}
    var router: AuthenticationRouterProtocol? {get set}
}
protocol AuthenticationRouterProtocol {
    static func createAuthentication() -> UIViewController & AuthenticationViewProtocol
}
