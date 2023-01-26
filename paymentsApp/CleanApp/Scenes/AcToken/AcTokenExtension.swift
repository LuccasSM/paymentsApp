//
//  AcTokenExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

extension AcTokenViewController: AcTokenViewControllerDisplayLogic {
    func display() {
        title = "acToken"
        titleView.text = "Olá, vamos gerar seu token para \nacessar o app?"
        buttonCancel.setTitle("cancelar", for: .normal)
        buttonToken.setTitle("gerar token", for: .normal)
    }
}
