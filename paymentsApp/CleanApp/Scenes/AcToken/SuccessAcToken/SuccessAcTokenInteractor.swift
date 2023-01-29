//
//  SuccessAcTokenInteractor.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

protocol SuccessAcTokenInteractorLogic {
    func fetch()
}

class SuccessAcTokenInteractor: SuccessAcTokenInteractorLogic {
    var presenter: SuccessAcTokenPresenterLogic?
    
    func fetch() {
        presenter?.fetch()
    }
}
