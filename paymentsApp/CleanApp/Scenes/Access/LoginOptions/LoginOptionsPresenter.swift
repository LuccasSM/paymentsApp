//
//  LoginOptionsPresenter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol LoginOptionsPresenterLogic {
    func fetch()
}

class LoginOptionsPresenter: LoginOptionsPresenterLogic {
    var viewController: LoginOptionsViewControllerDisplayLogic?
    
    func fetch() {
        viewController?.display()
    }
}
