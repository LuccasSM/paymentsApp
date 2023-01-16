//
//  SplashRouter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

protocol SplashRoutingLogic {
    func routeToPreLogin()
}

class SplashRouter: SplashRoutingLogic {
    weak var viewController: SplashViewController?
    
    // MARK: Routers
    
    func routeToPreLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
            UIView.animate(withDuration: 0, animations: {}, completion: { done in
                if done {
                    DispatchQueue.main.async {
                        let vc = PreLoginFactory.config()
                        let navigation = UINavigationController(rootViewController: vc)
                        navigation.modalPresentationStyle = .fullScreen
                        navigation.modalTransitionStyle = .crossDissolve
                        self.viewController?.present(navigation, animated: true)
                    }
                }
            })
        })
    }
}
