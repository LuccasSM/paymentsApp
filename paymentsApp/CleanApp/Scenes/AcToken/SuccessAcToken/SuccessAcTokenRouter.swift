//
//  SuccessAcTokenRouter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

protocol SuccessAcTokenRoutingLogic {
    func routeToFechar()
}

class SuccessAcTokenRouter: SuccessAcTokenRoutingLogic {
    weak var viewController: SuccessAcTokenViewController?
    
    // MARK: Routers
    
    func routeToFechar() {
        viewController?.dismissToPreLogin()
        setupStatusBarLight()
    }
}
