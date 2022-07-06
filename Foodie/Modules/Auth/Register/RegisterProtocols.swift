//
//  RegisterProtocols.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

protocol RegisterViewProtocol: AnyObject {
	var presenter: RegisterPresenterProtocol? {get set}
}
protocol RegisterInteractorProtocol: AnyObject {
	var presenter: RegisterPresenterProtocol? {get set}
}
protocol RegisterPresenterProtocol: AnyObject {
	var view: RegisterViewProtocol? {get set}
	var interactor: RegisterInteractorProtocol? {get set}
	var router: RegisterRouterProtocol? {get set}
}
protocol RegisterRouterProtocol: AnyObject {
	static func createRegister() -> UIViewController & RegisterViewProtocol
}
