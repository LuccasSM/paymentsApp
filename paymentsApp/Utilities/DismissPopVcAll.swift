//
//  DismissPopVcAll.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 15/01/23.
//

import UIKit

func dismissToPreLogin() {
    guard let rootVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
    guard let rootNav = rootVC.presentedViewController as? UINavigationController else { return }
    let presentingVC = ["AccessOptionsViewController"]
    
    if let accessVC = (rootNav.viewControllers[0].presentedViewController as? UINavigationController)?.viewControllers[0], presentingVC.contains(String(describing: type(of: accessVC.self))) {
        accessVC.navigationController?.dismiss(animated: true)
        setupStatusBarLight()
    } else {
        rootNav.popToViewController(rootNav.viewControllers[0], animated: true)
        setupStatusBarLight()
    }
}
