//
//  PreLoginConfigurator.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

class PreLoginConfigurator {
    
    // MARK: Configuration
    
    static func config() -> PreLoginViewController {
        let vc = PreLoginViewController()
        let interactor = PreLoginInteractor()
        let presenter = PreLoginPresenter()
        let router = PreLoginRouter()

        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.viewController = vc
        router.viewController = vc

        return vc
    }
}
