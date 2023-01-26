//
//  AccessOptionsExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

extension AccessOptionsViewController: AccessOptionsViewControllerDisplayLogic {
    func display() {
        
    // MARK: Setup leftBarButtonItem
            
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .light, scale: .large))?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(dismissToPreLogin))
        
        titleView.text = "É bom ter você aqui"
        textView.text = "Estamos disponíveis para tornar sua experiência bancária a melhor de todas. Mais antes de começarmos, por favor, nos informe se já é nosso cliente ou se está aqui para abrir uma conta conosco"
        button.setTitle("Criar minha conta", for: .normal)
        accessTap.attributedText = NSAttributedString(string: "Já sou cliente", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
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
            self.dismiss(animated: true)
            setupStatusBarLight()
        })
    }
    
    @objc func setupDismissAlertBackground() {
        self.dismiss(animated: true)
        self.timer?.invalidate()
    }
}
