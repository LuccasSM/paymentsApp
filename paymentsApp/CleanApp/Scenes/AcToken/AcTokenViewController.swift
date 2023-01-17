//
//  AcTokenViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

class AcTokenViewController: UIViewController {
    
    // MARK: Setup life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "acToken"
        
        setupViews()
    }
    
    // MARK: Setup itens of view
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    lazy var buttonCancel: UIButton = {
        let button = Buttons().buttonEnabled()
        button.backgroundColor = .white
        button.layer.borderColor = Colors.colorDefault.cgColor
        button.layer.borderWidth = 1
        button.setTitle("cancelar", for: .normal)
        button.setTitleColor(Colors.colorDefault, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    lazy var buttonToken: UIButton = {
        let button = Buttons().buttonEnabled()
        button.setTitle("gerar token", for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    // MARK: Setup views in screen
    
    func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonCancel)
        stackView.addArrangedSubview(buttonToken)
        
        setupConstraints()
    }
    
    // MARK: Setup constraints
    
    func setupConstraints() {
        let stackView = [
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ]
        
        NSLayoutConstraint.activate(stackView)
    }
    
    // MARK: Setup navigations

    
}
