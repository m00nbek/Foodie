//
//  WelcomePresenter.swift
//  WelcomePresenter
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class WelcomePresenter: WelcomePresenterProtocol {
    var view: WelcomeViewProtocol?
    var interactor: WelcomeInteractorProtocol?
    var router: WelcomeRouterProtocol?
    
    func showAuthentication(navigationController: UINavigationController?) {
        router?.pushAuthentication(navigationController: navigationController)
    }
}
