//
//  AuthenticationProtocols.swift
//  AuthenticationProtocols
//
//  Created by Oybek on 8/10/21.
//

import UIKit

protocol AuthenticationViewProtocol: AnyObject {
    var presenter: AuthenticationPresenterProtocol? {get set}
}
protocol AuthenticationInteractorProtocol: AnyObject {
    var presenter: AuthenticationPresenterProtocol? {get set}
}
protocol AuthenticationPresenterProtocol: AnyObject {
    var view: AuthenticationViewProtocol? {get set}
    var interactor: AuthenticationInteractorProtocol? {get set}
    var router: AuthenticationRouterProtocol? {get set}
}
protocol AuthenticationRouterProtocol: AnyObject {
    static func createAuthentication() -> UIViewController & AuthenticationViewProtocol
}
