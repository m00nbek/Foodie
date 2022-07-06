//
//  RootInteractor.swift
//  RootInteractor
//
//  Created by Oybek on 8/9/21.
//

import Foundation

class RootInteractor: RootInteractorProtocol {
	weak var presenter: RootPresenterProtocol?
    func isLoggedIn() -> Bool {
        return false
    }
}
