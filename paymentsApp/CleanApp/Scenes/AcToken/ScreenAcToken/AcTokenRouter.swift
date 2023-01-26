//
//  AcTokenRouter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

protocol AcTokenRoutingLogic {
    func routeToPreLogin()
    func routeToSuccessAcToken()
}

class AcTokenRouter: AcTokenRoutingLogic {
    weak var viewController: AcTokenViewController?
    
    // MARK: Routers
    
    func routeToPreLogin() {
        dismissToPreLogin()
    }
    
    func routeToSuccessAcToken() {
        if let vc = viewController?.navigationController {
            vc.pushViewController(SuccessAcTokenViewController(), animated: true)
        }
    }
}