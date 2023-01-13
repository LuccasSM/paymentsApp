//
//  LoginOptionsExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

extension LoginOptionsViewController: LoginOptionsViewControllerDisplayLogic {
    func display() {
        titleView.text = "É bom ter você aqui"
        textView.text = "Estamos disponíveis para tornar sua experiência bancária a melhor de todas. Mais antes de começarmos, por favor, nos informe se já é nosso cliente ou se está aqui para abrir uma conta conosco"
        button.setTitle("Criar minha conta", for: .normal)
        accessTap.attributedText = NSAttributedString(string: "Já sou cliente", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}
