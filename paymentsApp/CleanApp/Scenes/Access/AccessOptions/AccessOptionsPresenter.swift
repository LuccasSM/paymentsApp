//
//  AccessOptionsPresenter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol AccessOptionsPresenterLogic {
    func fetch()
}

class AccessOptionsPresenter: AccessOptionsPresenterLogic {
    var viewController: AccessOptionsViewControllerDisplayLogic?
    
    func fetch() {
        viewController?.display()
    }
}
