//
//  AcTokenFactory.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

class AcTokenFactory {
    
    // MARK: Factory
    
    static func config() -> AcTokenViewController {
        let vc = AcTokenViewController()
        let interactor = AcTokenInteractor()
        let presenter = AcTokenPresenter()
        let router = AcTokenRouter()

        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.viewController = vc
        router.viewController = vc

        return vc
    }
}
