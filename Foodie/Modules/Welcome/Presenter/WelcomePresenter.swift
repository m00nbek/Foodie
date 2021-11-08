//
//  WelcomePresenter.swift
//  WelcomePresenter
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class WelcomePresenter: WelcomePresenterProtocol {
    weak var view: WelcomeViewProtocol?
    weak var interactor: WelcomeInteractorProtocol?
    weak var router: WelcomeRouterProtocol?
    
    func showAuthentication(navigationController: UINavigationController?) {
        router?.pushAuthentication(navigationController: navigationController)
    }
}
