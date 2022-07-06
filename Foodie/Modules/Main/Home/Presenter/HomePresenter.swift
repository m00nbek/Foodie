//
//  HomePresenter.swift
//  Foodie
//
//  Created by Oybek on 10/19/21.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
	var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
}
