//
//  AcTokenViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol AcTokenViewControllerDisplayLogic {
    func display()
    func setupBackground()
}

class AcTokenViewController: UIViewController {
    var interactor: AcTokenInteractorLogic?
    var router: AcTokenRoutingLogic?
    
    // MARK: Setup life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    // MARK: Setup itens of view
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "unlocking")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.font = .systemFont(ofSize: 24, weight: .light)
        return text
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var text: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.textColor = .gray
        return text
    }()
    
    lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
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
    
    lazy var buttonCancel: UIButton = {
        let button = Buttons().buttonEnabled()
        button.backgroundColor = .white
        button.layer.borderColor = Colors.colorDefault.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(Colors.colorDefault, for: .normal)
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(dismissToPreLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonToken: UIButton = {
        let button = Buttons().buttonEnabled()
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(didTapGerarToken), for: .touchUpInside)
        return button
    }()
    
    // MARK: Setup views in screen
    
    func setupViews() {
        view.addSubview(image)
        view.addSubview(titleView)
        view.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(divider)
        scrollView.addSubview(stackViewContainer)
        stackViewContainer.addArrangedSubview(text)
        stackView.addArrangedSubview(buttonCancel)
        stackView.addArrangedSubview(buttonToken)
        
        interactor?.fetch()
        setupConstraints()
        lockOrientation()
    }
    
    // MARK: Setup constraints
    
    func setupConstraints() {
        let image = [
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
        ]
        
        let titleView = [
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: self.image.safeAreaLayoutGuide.bottomAnchor, constant: 16)
        ]
        
        let scrollView = [
            scrollView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.divider.bottomAnchor, constant: -30),
        ]
        
        let stackViewController = [
            stackViewContainer.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor),
            stackViewContainer.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -2 * 30),
            stackViewContainer.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
        ]
        
        let divider = [
            divider.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.bottomAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: -18),
        ]
        
        let stackView = [
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ]
        
        NSLayoutConstraint.activate(image + titleView + scrollView + stackViewController + divider + stackView)
        
        bgHidden()
    }
    
    // MARK: Setup navigations
    
    @objc func didTapGerarToken() {
        invokeFaceID()
    }
    
    @objc func didTapSuccessAcToken() {
        router?.routeToSuccessAcToken()
    }
}
