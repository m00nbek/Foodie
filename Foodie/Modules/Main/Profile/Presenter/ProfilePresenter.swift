//
//  ProfilePresenter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    weak var view: ProfileViewProtocol?
    var interactor: ProfileInteractorProtocol?
    var router: ProfileRouterProtocol?
}
