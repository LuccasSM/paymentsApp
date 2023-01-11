//
//  PreLoginInteractor.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

protocol PreLoginInteractorLogic {
    func fetch()
}

class PreLoginInteractor: PreLoginInteractorLogic {
    var presenter: PreLoginPresenterLogic?
    
    func fetch() {
        presenter?.fetch()
    }
}
