//
//  PreLoginViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 10/01/23.
//

import UIKit

protocol PreLoginViewControllerDisplayLogic {
    func display()
}

class PreLoginViewController: UIViewController {
    var interactor: PreLoginInteractorLogic?
    var router: PreLoginRoutingLogic?
    
    // MARK: Setup life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.grayLight
        
        setupViews()
    }
    
    // MARK: Setup itens of view
    
    lazy var viewGreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.colorDefault
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(Colors.colorDefault, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    
    lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(Colors.colorDefault, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    
    lazy var buttonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(Colors.colorDefault, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    
    lazy var versionApp: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .darkGray
        text.font = .systemFont(ofSize: 12, weight: .light)
        return text
    }()
    
    // MARK: Setup views in screen
    
    func setupViews() {
        view.addSubview(viewGreen)
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.addArrangedSubview(buttonThree)
        view.addSubview(versionApp)
        
        interactor?.fetch()
        setupStatusBarVisible()
        setupConstraints()
        lockOrientation()
    }
    
    // MARK: Setup constraints
    
    func setupConstraints() {
        let viewGreen = [
            viewGreen.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            viewGreen.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.52),
        ]
        
        let stackView = [
            stackView.heightAnchor.constraint(equalToConstant: 125),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65),
        ]
        
        let versionApp = [
            versionApp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            versionApp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ]
        
        NSLayoutConstraint.activate(viewGreen + stackView + versionApp)
    }
    
    // MARK: Setup navigations
    
    
}
