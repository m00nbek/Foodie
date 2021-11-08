//
//  HomePresenter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    weak var interactor: HomeInteractorProtocol?
    weak var router: HomeRouterProtocol?
}
