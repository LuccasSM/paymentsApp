//
//  AcTokenInteractor.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

protocol AcTokenInteractorLogic {
    func fetch()
}

class AcTokenInteractor: AcTokenInteractorLogic {
    var presenter: AcTokenPresenterLogic?
    
    func fetch() {
        presenter?.fetch()
    }
}
