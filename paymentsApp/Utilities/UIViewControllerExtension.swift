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
    
    @objc func startLoading(flagProgress: Bool = true) {
        if flagProgress {
            let viewProgress = ProgressView()
            
            if let window = UIApplication.shared.keyWindow {
                viewProgress.frame = window.frame
                window.addSubview(viewProgress)
            }
        }
    }
    
    @objc func stopLoading() {
        if let window = UIApplication.shared.keyWindow {
            for childView in window.subviews {
                if childView is ProgressView {
                    childView.removeFromSuperview()
                }
            }
        }
    }
    
    @objc func stopLoadingInBg() {
        NotificationCenter.default.addObserver(self, selector: #selector(stopLoading), name: UIApplication.willResignActiveNotification, object: .none)
    }
}


extension UIViewController {

    // MARK: Setup background & invoking background settings

    func setupBackground() {
        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
    }

    @objc func enterBG() {
        self.navigationController?.isNavigationBarHidden = true
    }

    @objc func exitBG() {
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: Setup background hidden is true

    func bgHidden() {
        let background = Background(frame: view.frame)
        self.view.addSubview(background)
        background.isHidden = true
    }
}
