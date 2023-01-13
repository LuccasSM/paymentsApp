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
    
    lazy var logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "LogoAppName")
        return logo
    }()

    lazy var textPay: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 30, weight: .bold)
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
    
    lazy var textPix: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 20, weight: .medium)
        text.textColor = .white
        text.numberOfLines = 0
        return text
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
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        button.contentVerticalAlignment = .bottom
        button.addTarget(self, action: #selector(didTapPix), for: .touchUpInside)
        return button
    }()
    
    lazy var imagePix: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logoPix")
        return image
    }()
    
    lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(Colors.colorDefault, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        button.contentVerticalAlignment = .bottom
        button.addTarget(self, action: #selector(didTapAcToken), for: .touchUpInside)
        return button
    }()
    
    lazy var imageToken: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "unlock")
        return image
    }()
    
    lazy var buttonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(Colors.colorDefault, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        button.contentVerticalAlignment = .bottom
        button.addTarget(self, action: #selector(didTapAccess), for: .touchUpInside)
        return button
    }()
    
    lazy var imageAccess: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "access")
        return image
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
        view.addSubview(logo)
        view.addSubview(textPay)
        view.addSubview(textPix)
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        buttonOne.addSubview(imagePix)
        stackView.addArrangedSubview(buttonTwo)
        buttonTwo.addSubview(imageToken)
        stackView.addArrangedSubview(buttonThree)
        buttonThree.addSubview(imageAccess)
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
        
        let logo = [
            logo.widthAnchor.constraint(equalToConstant: 200),
            logo.heightAnchor.constraint(equalToConstant: 60),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            logo.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
        ]
        
        let textPay = [
            textPay.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            textPay.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            textPay.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
        ]
        
        let textPix = [
            textPix.topAnchor.constraint(equalTo: self.textPay.safeAreaLayoutGuide.bottomAnchor, constant: 6),
            textPix.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
        ]
        
        let stackView = [
            stackView.heightAnchor.constraint(equalToConstant: 125),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65),
        ]
        
        let imagePix = [
            imagePix.centerXAnchor.constraint(equalTo: buttonOne.centerXAnchor),
            imagePix.widthAnchor.constraint(equalToConstant: 25),
            imagePix.heightAnchor.constraint(equalToConstant: 25),
            imagePix.topAnchor.constraint(equalTo: buttonOne.safeAreaLayoutGuide.topAnchor, constant: 30),
        ]
        
        let imageToken = [
            imageToken.centerXAnchor.constraint(equalTo: buttonTwo.centerXAnchor),
            imageToken.widthAnchor.constraint(equalToConstant: 25),
            imageToken.heightAnchor.constraint(equalToConstant: 25),
            imageToken.topAnchor.constraint(equalTo: buttonTwo.safeAreaLayoutGuide.topAnchor, constant: 30),
        ]
        
        let imageAccess = [
            imageAccess.centerXAnchor.constraint(equalTo: buttonThree.centerXAnchor),
            imageAccess.widthAnchor.constraint(equalToConstant: 25),
            imageAccess.heightAnchor.constraint(equalToConstant: 25),
            imageAccess.topAnchor.constraint(equalTo: buttonThree.safeAreaLayoutGuide.topAnchor, constant: 30),
        ]
        
        let versionApp = [
            versionApp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            versionApp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ]
        
        NSLayoutConstraint.activate(viewGreen + logo + textPay + textPix + stackView + imagePix + imageToken + imageAccess + versionApp)
    }
    
    // MARK: Setup navigations
    
    @objc func didTapPix() {
        router?.routeToPix()
    }
    
    @objc func didTapAcToken() {
        router?.routeToAcToken()
    }
    
    @objc func didTapAccess() {
        router?.routeToAccess()
    }
}
