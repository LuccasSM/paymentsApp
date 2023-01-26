//
//  LoginPresenter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 15/01/23.
//

import UIKit

protocol LoginPresenterLogic {
    func fetch()
}

class LoginPresenter: LoginPresenterLogic {
    var viewController: LoginViewControllerDisplayLogic?
    
    func fetch() {
        viewController?.display()
        viewController?.setupBackground()
        viewController?.dismissAlertBackground()
    }
}
