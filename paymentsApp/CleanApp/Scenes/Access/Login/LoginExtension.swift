//
//  LoginExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 15/01/23.
//

import UIKit

extension LoginViewController: LoginViewControllerDisplayLogic {
    func display() {
        
    // MARK: Setup leftBarButtonItem
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .light, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(dismissToPreLogin))
        
        titleView.text = "acessar sua conta"
        button.setTitle("Entrar", for: .normal)
        accessTap.text = "abra sua conta no Alpha Credit  >"
        tfCpf.placeholder = "CPF"
        tfSenha.placeholder = "Senha"
        textLembrar.text = "lembrar meus dados"
    }
    
    func dismissAlertBackground() {
        NotificationCenter.default.addObserver(self, selector: #selector(setupDismissAlertBackground), name: UIApplication.willResignActiveNotification, object: .none)
    }
    
    @objc func setupAlert() {
        alert = UIAlertController(title: "Você será redirecionado", message: "Fique tranquilo! Você será \nredirecionado para o nosso site onde \npoderá dar continuidade com a \nabertura da sua conta Alpha Credit.", preferredStyle: .alert)
        self.alert?.addAction(UIAlertAction(title: "fechar", style: .default, handler:  { action in
            self.timer?.invalidate()
        }))
        self.alert?.addAction(UIAlertAction(title: "Ir para o site", style: .default, handler: { action in
            self.setupBrowser()
        }))
        
        if let alert = alert {
            present(alert, animated: true)
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(startBrowser), userInfo: nil, repeats: false)
        }
    }
    
    @objc func startBrowser() {
        setupBrowser()
        self.alert?.dismiss(animated: true)
    }
    
    @objc func setupBrowser() {
        timer?.invalidate()
        guard let url = URL(string: "https://google.com") else { return }
        UIApplication.shared.open(url)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.navigationController?.popViewController(animated: true)
            setupStatusBarLight()
        })
    }
    
    @objc func setupDismissAlertBackground() {
        self.navigationController?.popViewController(animated: true)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        
        if let window = view.window {
            window.layer.add(transition, forKey: kCATransition)
        }
        self.timer?.invalidate()
    }
}
