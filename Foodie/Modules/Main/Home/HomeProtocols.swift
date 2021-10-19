//
//  HomeProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? {get set}
}
protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? {get set}
}
protocol HomePresenterProtocol {
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
}
protocol HomeRouterProtocol {
    static func createHome() -> UIViewController & HomeViewProtocol
}
