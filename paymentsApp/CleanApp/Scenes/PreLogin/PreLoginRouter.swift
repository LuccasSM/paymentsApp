//
//  PreLoginRouter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

protocol PreLoginRoutingLogic {
    func routeToPix()
    func routeToAcToken()
    func routeToLogin()
}

class PreLoginRouter: PreLoginRoutingLogic {
    weak var viewController: PreLoginViewController?
    
    // MARK: Routers
    
    func routeToPix() {
        if let vc = viewController?.navigationController {
            vc.pushViewController(PixViewController(), animated: true)
        }
    }
    
    func routeToAcToken() {
        let vc = AcTokenFactory.config()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        viewController?.present(navigation, animated: true)
        setupStatusBarDark()
    }
    
    func routeToLogin() {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "AccessOptionsViewController") {
            if let vc = viewController?.navigationController {
                vc.pushViewController(LoginFactory.config(), animated: true)
            }
        } else {
            let vc = AccessOptionsFactory.config()
            let navigation = UINavigationController(rootViewController: vc)
            navigation.modalPresentationStyle = .fullScreen
            viewController?.present(navigation, animated: true)
            setupStatusBarDark()
        }
    }
}
