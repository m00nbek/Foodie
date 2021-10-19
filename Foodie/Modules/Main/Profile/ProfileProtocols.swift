//
//  ProfileProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol ProfileViewProtocol {
    var presenter: ProfilePresenterProtocol? {get set}
}
protocol ProfileInteractorProtocol {
    var presenter: ProfilePresenterProtocol? {get set}
}
protocol ProfilePresenterProtocol {
    var view: ProfileViewProtocol? {get set}
    var interactor: ProfileInteractorProtocol? {get set}
    var router: ProfileRouterProtocol? {get set}
}
protocol ProfileRouterProtocol {
    static func createProfile() -> UIViewController & ProfileViewProtocol
}
