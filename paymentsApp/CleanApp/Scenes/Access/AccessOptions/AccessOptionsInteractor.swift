//
//  AccessOptionsInteractor.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol AccessOptionsInteractorLogic {
    func fetch()
}

class AccessOptionsInteractor: AccessOptionsInteractorLogic {
    var presenter: AccessOptionsPresenterLogic?
    
    func fetch() {
        presenter?.fetch()
    }
}
