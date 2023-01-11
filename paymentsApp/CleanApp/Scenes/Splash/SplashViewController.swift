//
//  SplashViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 09/01/23.
//

import UIKit

protocol SplashViewControllerDisplayLogic {
    func display()
}

class SplashViewController: UIViewController, SplashViewControllerDisplayLogic {
    var interactor: SplashInteractorLogic?
    var router: SplashRoutingLogic?
    
    // MARK: Setup display | * is not used *
    
    func display() {}
    
    // MARK: Setup life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.colorDefault
        
        setupViews()
    }
    
    // MARK: Setup itens of view
    
    lazy var logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "LogoAppName")
        return logo
    }()
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    // MARK: Setup views in screen
    
    func setupViews() {
        view.addSubview(logo)
        view.addSubview(spinner)
        
        interactor?.fetch()
        setupStatusBarHidden()
        setupAnimations()
        setupConstraints()
        lockOrientation()
        navigationPreLogin()
    }
    
    // MARK: Setup constraints
    
    func setupConstraints() {
        let logo = [
            logo.widthAnchor.constraint(equalToConstant: 350),
            logo.heightAnchor.constraint(equalToConstant: 105),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -65),
        ]
        
        let spinner = [
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
        ]
        
        NSLayoutConstraint.activate(logo + spinner)
    }
    
    // MARK: Setup animations and navigations
    
    func setupAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            UIView.animate(withDuration: 0, animations: {}, completion: { done in
                if done {
                    DispatchQueue.main.async {
                        self.spinner.startAnimating()
                        let transition = CATransition()
                        if let window = self.view.window {
                            window.layer.add(transition, forKey: kCATransition)
                        }
                    }
                }
            })
        })
    }
    
    @objc func navigationPreLogin() {
        router?.routeToPreLogin()
    }
}
