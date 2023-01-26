//
//  AccessOptionsViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol AccessOptionsViewControllerDisplayLogic {
    func display()
    func setupBackground()
    func dismissAlertBackground()
}

class AccessOptionsViewController: UIViewController {
    var interactor: AccessOptionsInteractorLogic?
    var router: AccessOptionsRoutingLogic?
    var timer: Timer?
    var alert: UIAlertController?
    
    // MARK: Setup life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    // MARK: Setup UserDefaults Access
        
        UserDefaults.standard.set(true, forKey: "AccessOptionsViewController")
    }
    
    // MARK: Setup itens of view
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.gifImageWithName("animatedMobilePhone")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleView: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    lazy var textView: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 16)
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    lazy var button: UIButton = {
        let button = Buttons().buttonEnabled()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAlert), for: .touchUpInside)
        return button
    }()
    
    lazy var accessTap: UILabel = {
        let text = UILabel()
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapLogin))
        text.addGestureRecognizer(tap)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isUserInteractionEnabled = true
        text.textColor = Colors.colorDefault
        text.font = .systemFont(ofSize: 18, weight: .medium)
        text.addGestureRecognizer(tap)
        return text
    }()
    
    // MARK: Setup views in screen
    
    func setupViews() {
        view.addSubview(image)
        view.addSubview(titleView)
        view.addSubview(textView)
        view.addSubview(button)
        view.addSubview(accessTap)
        
        interactor?.fetch()
        setupConstraints()
        lockOrientation()
    }
    
    // MARK: Setup constraints
    
    func setupConstraints() {
        let image = [
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let titleView = [
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: self.image.safeAreaLayoutGuide.bottomAnchor, constant: 100),
        ]
        
        let textView = [
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: self.titleView.topAnchor),
            textView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            textView.heightAnchor.constraint(equalToConstant: 160),
        ]
        
        let button = [
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.accessTap.safeAreaLayoutGuide.topAnchor, constant: -16),
        ]
        
        let accessTap = [
            accessTap.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accessTap.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ]
        
        NSLayoutConstraint.activate(image + titleView + textView + button + accessTap)
        
        bgHidden()
    }
    
    // MARK: Setup navigations
    
    @objc func didTapPreLogin() {
        router?.routeToPreLogin()
    }
    
    @objc func didTapAlert() {
        router?.routeToBrowser()
    }
    
    @objc func didTapLogin() {
        router?.routeToLogin()
    }
}
