//
//  SuccessAcTokenPresenter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

protocol SuccessAcTokenPresenterLogic {
    func fetch()
}

class SuccessAcTokenPresenter: SuccessAcTokenPresenterLogic {
    var viewController: SuccessAcTokenViewControllerDisplayLogic?
    
    func fetch() {
        viewController?.display()
    }
}
