//
//  ProgressView.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit
import JGProgressHUD

class ProgressView: UIView {
    private let progress = JGProgressHUD(style: .dark)
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        setupProgress()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
    
    // MARK: setupProgress
    
    func setupProgress() {
        self.backgroundColor = Colors.opacity
        self.layer.zPosition = 2
        
        progress.minimumDisplayTime = .infinity
        progress.show(in: self)
    }
}
