//
//  PreLoginPresenter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

protocol PreLoginPresenterLogic {
    func fetch()
}

class PreLoginPresenter: PreLoginPresenterLogic {
    var viewController: PreLoginViewControllerDisplayLogic?
    
    func fetch() {
        viewController?.display()
        viewController?.setupBackground()
    }
}
