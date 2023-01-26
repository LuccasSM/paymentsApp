//
//  AcTokenExtension.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit
import LocalAuthentication

extension AcTokenViewController: AcTokenViewControllerDisplayLogic {
    func display() {
        title = "acToken"
        titleView.text = "Olá, vamos gerar seu token para \nacessar o app?"
        buttonCancel.setTitle("cancelar", for: .normal)
        buttonToken.setTitle("gerar token", for: .normal)
        text.text = "O acToken é um serviço exclusivo dentro do app Alpha Credit, utilizado para lhe assegurar ao máximo enquanto estiver navegando via mobile, assim lhe garantindo conforto e segurança em sua autenticação. \n\nCom nosso token, você fica livre de inúmeras senhas e também aproveita serviços mais modernos de seu dispositivo (Ex: biometria facial). \n\nRessaltamos também que você pode consultar seu token até mesmo sem internet."
    }
    
    func invokeFaceID() {
        let context = LAContext()
        var error: NSError? = nil
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Por favor, autorize o uso do Face/Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        let alert = UIAlertController(title: "Ocorreu um erro inesperado", message: "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Voltar", style: .default, handler: { action in
                            self?.didTapCancelar()
                        }))
                        self?.present(alert, animated: true)
                        return
                    }
                    
                    let alert = UIAlertController(title: "Deu sucesso", message: "está usando", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self?.present(alert, animated: true)
                }
            }
        } else {
            let alert = UIAlertController(title: "Erro", message: "O acToken só funciona mediante a auteticação do Face ID do seu dispositivo!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Voltar", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }
}
