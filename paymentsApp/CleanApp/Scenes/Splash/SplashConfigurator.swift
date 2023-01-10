//
//  SplashConfigurator.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

class SplashConfigurator {
    
    // MARK: Configuration
    
    static func config() -> SplashViewController {
        let vc = SplashViewController()
        let interactor = SplashInteractor()
        let presenter = SplashPresenter()
        let router = SplashRouter()

        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.viewController = vc
        router.viewController = vc

        return vc
    }
}
