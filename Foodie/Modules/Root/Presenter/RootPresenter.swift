//
//  RootPresenter.swift
//  RootPresenter
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class RootPresenter: RootPresenterProtocol {
     weak var view: RootViewProtocol?
     var interactor: RootInteractorProtocol?
     var router: RootRouterProtocol?
   
    func presentWelcome(in view: UIViewController?) {
        if !interactor!.isLoggedIn() {
            router?.presentWelcome(in: view)
        }
    }
}

