//
//  LoginViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 12/01/23.
//

import UIKit

protocol LoginViewControllerDisplayLogic {
    func display()
    func setupBackground()
    func dismissAlertBackground()
}

class LoginViewController: UIViewController {
    var interactor: LoginInteractorLogic?
    var router: LoginRoutingLogic?
    var timer: Timer?
    var alert: UIAlertController?
    
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
    
    lazy var titleView: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 24, weight: .medium)
        title.textColor = .white
        return title
    }()
    
    lazy var viewTextField: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var tfCpf: UITextField = {
        let tf = TextField().textField()
        tf.textColor = .gray
        return tf
    }()
    
    lazy var borderCpf: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.colorDefault
        return view
    }()
    
    lazy var tfSenha: UITextField = {
        let tf = TextField().textField()
        tf.isSecureTextEntry = true
        tf.textColor = .gray
        return tf
    }()
    
    lazy var borderSenha: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.colorDefault
        return view
    }()
    
    lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.onTintColor = Colors.colorDefault
        return switchButton
    }()
    
    lazy var textLembrar: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = Colors.colorDefault
        text.font = .systemFont(ofSize: 14, weight: .medium)
        return text
    }()
    
    lazy var button: UIButton = {
        let button = Buttons().buttonEnabled()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        return button
    }()
    
    lazy var accessTap: UILabel = {
        let text = UILabel()
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAlert))
        text.addGestureRecognizer(tap)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isUserInteractionEnabled = true
        text.textColor = Colors.colorDefault
        text.font = .systemFont(ofSize: 16, weight: .medium)
        text.addGestureRecognizer(tap)
        return text
    }()
    
    // MARK: Setup views in screen
    
    func setupViews() {
        view.addSubview(viewGreen)
        viewGreen.addSubview(titleView)
        view.addSubview(viewTextField)
        viewTextField.addSubview(tfCpf)
        tfCpf.addSubview(borderCpf)
        viewTextField.addSubview(tfSenha)
        tfSenha.addSubview(borderSenha)
        viewTextField.addSubview(switchButton)
        viewTextField.addSubview(textLembrar)
        view.addSubview(button)
        view.addSubview(accessTap)
        
        interactor?.fetch()
        setupConstraints()
        lockOrientation()
    }
    
    // MARK: Setup constraints
    
    func setupConstraints() {
        let viewGreen = [
            viewGreen.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            viewGreen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.27),
            viewGreen.topAnchor.constraint(equalTo: view.topAnchor),
        ]
        
        let titleView = [
            titleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleView.bottomAnchor.constraint(equalTo: self.viewTextField.safeAreaLayoutGuide.topAnchor, constant: -15),
        ]
        
        let viewTextField = [
            viewTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            viewTextField.heightAnchor.constraint(equalToConstant: 250),
            viewTextField.topAnchor.constraint(equalTo: self.viewGreen.bottomAnchor, constant: -40),
            viewTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let tfCpf = [
            tfCpf.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            tfCpf.leftAnchor.constraint(equalTo: self.viewTextField.leftAnchor, constant: 30),
            tfCpf.topAnchor.constraint(equalTo: self.viewTextField.topAnchor, constant: 40),
        ]
        
        let borderCpf = [
            borderCpf.heightAnchor.constraint(equalToConstant: 1),
            borderCpf.topAnchor.constraint(equalTo: self.tfCpf.bottomAnchor),
            borderCpf.leftAnchor.constraint(equalTo: self.viewTextField.leftAnchor, constant: 30),
            borderCpf.rightAnchor.constraint(equalTo: self.viewTextField.rightAnchor, constant: -30),
        ]
        
        let tfSenha = [
            tfSenha.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            tfSenha.leftAnchor.constraint(equalTo: self.viewTextField.leftAnchor, constant: 30),
            tfSenha.topAnchor.constraint(equalTo: self.borderCpf.bottomAnchor, constant: 40),
        ]
        
        let borderSenha = [
            borderSenha.heightAnchor.constraint(equalToConstant: 1),
            borderSenha.topAnchor.constraint(equalTo: self.tfSenha.bottomAnchor),
            borderSenha.leftAnchor.constraint(equalTo: self.viewTextField.leftAnchor, constant: 30),
            borderSenha.rightAnchor.constraint(equalTo: self.viewTextField.rightAnchor, constant: -30),
        ]
        
        let switchButton = [
            switchButton.topAnchor.constraint(equalTo: self.borderSenha.bottomAnchor, constant: 40),
            switchButton.leftAnchor.constraint(equalTo: self.viewTextField.leftAnchor, constant: 30),
        ]
        
        let textLembrar = [
            textLembrar.centerYAnchor.constraint(equalTo: self.switchButton.centerYAnchor),
            textLembrar.leftAnchor.constraint(equalTo: self.switchButton.rightAnchor, constant: 20),
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
        
        NSLayoutConstraint.activate(viewGreen + titleView + viewTextField + tfCpf + borderCpf + tfSenha + borderSenha + switchButton + textLembrar + button + accessTap)
        
        bgHidden()
    }
    
    // MARK: Setup navigations
    
    @objc func didTapAlert() {
        router?.routeToBrowser()
    }
}
