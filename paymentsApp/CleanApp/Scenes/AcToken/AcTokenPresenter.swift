//
//  AcTokenPresenter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

protocol AcTokenPresenterLogic {
    func fetch()
}

class AcTokenPresenter: AcTokenPresenterLogic {
    var viewController: AcTokenViewControllerDisplayLogic?
    
    func fetch() {
        viewController?.display()
        viewController?.setupBackground()
    }
}
