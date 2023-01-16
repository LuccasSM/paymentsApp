//
//  LoginRouter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 15/01/23.
//

import UIKit

protocol LoginRoutingLogic {
    func routeToPreLogin()
    func routeToBrowser()
}

class LoginRouter: LoginRoutingLogic {
    weak var viewController: LoginViewController?
    
    // MARK: Routers
    
    func routeToPreLogin() {
        dismissToPreLogin()
    }
    
    func routeToBrowser() {
        viewController?.setupAlert()
    }
}
