//
//  Buttons.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 15/01/23.
//

import UIKit

class Buttons: UIButton {
    
    // MARK: Bottom button
    
    func buttonEnabled() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.colorDefault
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        return button
    }
    
    // MARK: Bottom button acToken Small
    
    func buttonSmallAcToken() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.graySmallButton
        button.layer.cornerRadius = 22.5
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        return button
    }
}
