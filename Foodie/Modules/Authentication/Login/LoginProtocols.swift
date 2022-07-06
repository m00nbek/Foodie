//
//  LoginProtocols.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
	var presenter: LoginPresenterProtocol? {get set}
}
protocol LoginInteractorProtocol: AnyObject {
	var presenter: LoginPresenterProtocol? {get set}
}
protocol LoginPresenterProtocol: AnyObject {
	var view: LoginViewProtocol? {get set}
	var interactor: LoginInteractorProtocol? {get set}
	var router: LoginRouterProtocol? {get set}
}
protocol LoginRouterProtocol: AnyObject {
	static func createLogin() -> UIViewController & LoginViewProtocol
}
