//
//  SplashInteractor.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

protocol SplashInteractorLogic {
    func fetch()
}

class SplashInteractor: SplashInteractorLogic {
    var presenter: SplashPresenterLogic?
    
    func fetch() {
        presenter?.fetch()
    }
}
