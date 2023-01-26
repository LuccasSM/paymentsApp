//
//  AccessOptionsRouter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol AccessOptionsRoutingLogic {
    func routeToBrowser()
    func routeToLogin()
}

class AccessOptionsRouter: AccessOptionsRoutingLogic {
    weak var viewController: AccessOptionsViewController?
    
    // MARK: Routers
    
    func routeToBrowser() {
        viewController?.setupAlert()
    }
    
    func routeToLogin() {
        if let vc = viewController?.navigationController {
            vc.pushViewController(LoginFactory.config(), animated: true)
            setupStatusBarLight()
        }
    }
}
