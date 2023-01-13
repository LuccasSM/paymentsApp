//
//  LoginOptionsInteractor.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol LoginOptionsInteractorLogic {
    func fetch()
}

class LoginOptionsInteractor: LoginOptionsInteractorLogic {
    var presenter: LoginOptionsPresenterLogic?
    
    func fetch() {
        presenter?.fetch()
    }
}
