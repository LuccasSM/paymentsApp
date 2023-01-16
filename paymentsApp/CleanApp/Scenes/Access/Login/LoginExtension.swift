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
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .light, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(didTapPreLogin))
        
        titleView.text = "acessar sua conta"
        button.setTitle("ok", for: .normal)
        accessTap.text = "abra sua conta no Alpha Credit >"
        tfCpf.placeholder = "CPF"
        tfSenha.placeholder = "Senha"
        textLembrar.text = "lembrar meus dados"
    }
    
    @objc func setupAlert() {
        let alert = UIAlertController(title: "Você será redirecionado", message: "Fique tranquilo! Você será \nredirecionado para o nosso site onde \npoderá dar continuidade com a \nabertura da sua conta Alpha Credit.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "fechar", style: .default))
        alert.addAction(UIAlertAction(title: "Ir para o site", style: .default, handler: {action in
            self.setupBrowser()
        }))
        present(alert, animated: true)
    }
    
    @objc func setupBrowser() {
        guard let url = URL(string: "https://google.com") else { return }
        UIApplication.shared.open(url)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.navigationController?.popViewController(animated: true)
            setupStatusBarLight()
        })
    }
}
