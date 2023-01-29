//
//  SuccessAcTokenExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

extension SuccessAcTokenViewController: SuccessAcTokenViewControllerDisplayLogic {
    func display() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(eventContDown), userInfo: nil, repeats: true)
        
        icon.image = UIImage(named: "padlock-success-acToken.png")
        titleView.text = "O seu token é:"
        expiryText.text = "expira em: 100"
        button.setTitle("Fechar", for: .normal)
    }
}
