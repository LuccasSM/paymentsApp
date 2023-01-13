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
    func routeToAccess()
}

class PreLoginRouter: PreLoginRoutingLogic {
    weak var viewController: PreLoginViewController?
    
    // MARK: Routers
    
    func routeToPix() {
        if let vc = viewController?.navigationController {
            vc.pushViewController(PixHomeViewController(), animated: true)
        }
    }
    
    func routeToAcToken() {
        let vc = AcTokenHomeViewController()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        viewController?.present(navigation, animated: true)
    }
    
    func routeToAccess() {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "LoginOptionsViewController") {
            if let vc = viewController?.navigationController {
                vc.pushViewController(TesteViewController(), animated: true)
            }
        } else {
            let vc = LoginOptionsConfigurator.config()
            let navigation = UINavigationController(rootViewController: vc)
            navigation.modalPresentationStyle = .fullScreen
            viewController?.present(navigation, animated: true)
        }
    }
}
