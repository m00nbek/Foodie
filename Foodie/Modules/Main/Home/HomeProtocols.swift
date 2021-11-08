//
//  HomeProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? {get set}
}
protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? {get set}
}
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
}
protocol HomeRouterProtocol: AnyObject {
    static func createHome() -> UIViewController & HomeViewProtocol
}
