//
//  AuthProtocols.swift
//  Foodie
//
//  Created by Oybek Melikulov on 7/6/22.
//

import UIKit

protocol AuthViewProtocol: AnyObject {
	var presenter: AuthPresenterProtocol? {get set}
}
protocol AuthInteractorProtocol: AnyObject {
	var presenter: AuthPresenterProtocol? {get set}
}
protocol AuthPresenterProtocol: AnyObject {
	var view: AuthViewProtocol? {get set}
	var interactor: AuthInteractorProtocol? {get set}
	var router: AuthRouterProtocol? {get set}
}
protocol AuthRouterProtocol: AnyObject {
	static func createAuth() -> UIViewController & AuthViewProtocol
}
