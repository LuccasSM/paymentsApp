//
//  PreLoginExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

extension PreLoginViewController: PreLoginViewControllerDisplayLogic {
    func display() {
        versionApp.text = "versão 1.0"
        buttonOne.setTitle("Pix", for: .normal)
        buttonTwo.setTitle("acToken", for: .normal)
        buttonThree.setTitle("Acessar", for: .normal)
        textPay.text = "Quer pagar e receber a \nqualquer hora e de graça?"
        textPix.text = "Chegou o Pix aqui no Alpha Credit. \nCadastre-se e confira!"
    }
}
