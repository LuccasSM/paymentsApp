//
//  LoginInteractor.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 15/01/23.
//

import UIKit

protocol LoginInteractorLogic {
    func fetch()
}

class LoginInteractor: LoginInteractorLogic {
    var presenter: LoginPresenterLogic?
    
    func fetch() {
        presenter?.fetch()
    }
}
