//
//  SuccessAcTokenfactory.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

class SuccessAcTokenFactory {
    
    // MARK: Factory
    
    static func config() -> SuccessAcTokenViewController {
        let vc = SuccessAcTokenViewController()
        let interactor = SuccessAcTokenInteractor()
        let presenter = SuccessAcTokenPresenter()
        let router = SuccessAcTokenRouter()

        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.viewController = vc
        router.viewController = vc

        return vc
    }
}
