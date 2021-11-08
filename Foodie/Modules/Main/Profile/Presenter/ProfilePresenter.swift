//
//  ProfilePresenter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    weak var view: ProfileViewProtocol?
    weak var interactor: ProfileInteractorProtocol?
    weak var router: ProfileRouterProtocol?
}
