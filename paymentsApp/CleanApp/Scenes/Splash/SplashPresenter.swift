//
//  SplashPresenter.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

protocol SplashPresenterLogic {
    func fetch()
}

class SplashPresenter: SplashPresenterLogic {
    var viewController: SplashViewControllerDisplayLogic?
    
    func fetch() {
        viewController?.display()
    }
}
