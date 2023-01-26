//
//  Background.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 17/01/23.
//

import UIKit

class Background: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.colorDefault
        
        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
        
    // MARK: View's entering background
        
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        image.image = UIImage(named: "LogoApp")
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -16),
            image.widthAnchor.constraint(equalToConstant: 220),
            image.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Calling background enter and exit functions
    
    @objc func enterBG() {
        self.isHidden = false
    }
        
    @objc func exitBG() {
        self.isHidden = true
    }
}

    // MARK: invoking background settings

extension UIViewController {
    
    // MARK: Setup background
    
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
