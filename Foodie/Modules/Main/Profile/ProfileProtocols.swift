//
//  ProfileProtocols.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol? {get set}
}
protocol ProfileInteractorProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol? {get set}
}
protocol ProfilePresenterProtocol: AnyObject {
    var view: ProfileViewProtocol? {get set}
    var interactor: ProfileInteractorProtocol? {get set}
    var router: ProfileRouterProtocol? {get set}
}
protocol ProfileRouterProtocol: AnyObject {
    static func createProfile() -> UIViewController & ProfileViewProtocol
}
