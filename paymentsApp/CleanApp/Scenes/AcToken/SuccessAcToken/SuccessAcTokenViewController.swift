//
//  SuccessAcTokenViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

protocol SuccessAcTokenViewControllerDisplayLogic {
    func display()
}

class SuccessAcTokenViewController: UIViewController {
    var interactor: SuccessAcTokenInteractorLogic?
    var router: SuccessAcTokenRoutingLogic?
    var countDown = 100
    var timer = Timer()
    
    // MARK: Setup life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        setupViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        countDown = 100
    }
    
    // MARK: Setup itens of view
    
    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleView: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var tokenText: UILabel = {
        let text = UILabel()
        let numbersToken = Int.random(in: 100000...999999)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "\(numbersToken)"
        text.font = .systemFont(ofSize: 40, weight: .medium)
        return text
    }()
    
    lazy var expiryText: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .systemGray
        return text
    }()
    
    lazy var button: UIButton = {
        let button = Buttons().buttonSmallAcToken()
        button.addTarget(self, action: #selector(didTapFechar), for: .touchUpInside)
        return button
    }()
    
    // MARK: Setup views in screen
    
    func setupViews() {
        view.addSubview(icon)
        view.addSubview(titleView)
        view.addSubview(tokenText)
        view.addSubview(expiryText)
        view.addSubview(button)
        
        interactor?.fetch()
        setupConstraints()
        lockOrientation()
    }
    
    // MARK: Setup constraints
    
    func setupConstraints() {
        let icon = [
            icon.widthAnchor.constraint(equalToConstant: 120),
            icon.heightAnchor.constraint(equalToConstant: 130),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        ]
        
        let titleView = [
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: self.icon.safeAreaLayoutGuide.bottomAnchor, constant: 30),
        ]
        
        let tokenText = [
            tokenText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tokenText.topAnchor.constraint(equalTo: self.titleView.safeAreaLayoutGuide.bottomAnchor, constant: 50),
        ]
        
        let expiryText = [
            expiryText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            expiryText.topAnchor.constraint(equalTo: self.tokenText.safeAreaLayoutGuide.bottomAnchor, constant: 40),
        ]
        
        let button = [
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 180),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ]
        
        NSLayoutConstraint.activate(icon + titleView + tokenText + expiryText + button)
        bgHidden()
    }
    
    // MARK: Setup navigations and functions
    
    @objc func didTapFechar() {
        router?.routeToFechar()
    }
    
    @objc func eventContDown() {
        countDown -= 1
        expiryText.text = "expira em: \(countDown)"
        
        if countDown == 0 {
            router?.routeToFechar()
        }
    }
}
