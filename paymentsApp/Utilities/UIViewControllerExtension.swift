//
//  UIViewControllerExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

extension UIViewController {
    
    // MARK: DismissPop-VC all app
    
    @objc public func dismissToPreLogin() {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
        guard let rootNav = rootVC.presentedViewController as? UINavigationController else { return }
        let presentingVC = ["AccessOptionsViewController", "AcTokenViewController"]
        
        if let accessVC = (rootNav.viewControllers[0].presentedViewController as? UINavigationController)?.viewControllers[0], presentingVC.contains(String(describing: type(of: accessVC.self))) {
            accessVC.navigationController?.dismiss(animated: true)
            setupStatusBarLight()
        } else {
            rootNav.popToViewController(rootNav.viewControllers[0], animated: true)
            setupStatusBarLight()
        }
    }
}

extension UIViewController {
    
    // MARK: Settings Progress
    
    func startLoading(flagProgress: Bool = true) {
        if flagProgress {
            let viewProgress = ProgressView()
            
            if let window = UIApplication.shared.keyWindow {
                viewProgress.frame = window.frame
                window.addSubview(viewProgress)
            }
        }
    }
    
    func stopLoading() {
        if let window = UIApplication.shared.keyWindow {
            for childView in window.subviews {
                if childView is ProgressView {
                    childView.removeFromSuperview()
                }
            }
        }
    }
}
