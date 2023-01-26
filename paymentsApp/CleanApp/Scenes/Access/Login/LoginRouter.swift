//
//  LoginRouter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 15/01/23.
//

import UIKit

protocol LoginRoutingLogic {
    func routeToBrowser()
}

class LoginRouter: LoginRoutingLogic {
    weak var viewController: LoginViewController?
    
    // MARK: Routers
    
    func routeToBrowser() {
        viewController?.setupAlert()
    }
}
