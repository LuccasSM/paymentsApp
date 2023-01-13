//
//  LoginOptionsConfigurator.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

class LoginOptionsConfigurator {
    
    // MARK: Configuration
    
    static func config() -> LoginOptionsViewController {
        let vc = LoginOptionsViewController()
        let interactor = LoginOptionsInteractor()
        let presenter = LoginOptionsPresenter()
        let router = LoginOptionsRouter()

        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.viewController = vc
        router.viewController = vc

        return vc
    }
}
