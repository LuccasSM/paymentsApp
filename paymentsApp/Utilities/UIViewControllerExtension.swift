//
//  UIViewControllerExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

extension UIViewController {
    
    // MARK: Setting Progress
    
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
