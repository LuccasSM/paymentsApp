//
//  AccessOptionsFactory.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

class AccessOptionsFactory {
    
    // MARK: Factory
    
    static func config() -> AccessOptionsViewController {
        let vc = AccessOptionsViewController()
        let interactor = AccessOptionsInteractor()
        let presenter = AccessOptionsPresenter()
        let router = AccessOptionsRouter()

        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.viewController = vc
        router.viewController = vc

        return vc
    }
}
