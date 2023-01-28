//
//  SuccessAcTokenViewController.swift
//  paymentsApp
//
//  Created by Luccas Santana Marinho on 26/01/23.
//

import UIKit

class SuccessAcTokenViewController: UIViewController {
    
    var countDown = 100
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(eventContDown), userInfo: nil, repeats: true)
        
        view.addSubview(icon)
        view.addSubview(titleView)
        view.addSubview(tokenText)
        view.addSubview(expiryText)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 120),
            icon.heightAnchor.constraint(equalToConstant: 130),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: icon.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            
            tokenText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tokenText.topAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            
            expiryText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            expiryText.topAnchor.constraint(equalTo: tokenText.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 180),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        countDown = 100
    }
    
    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "padlock-success-acToken.png")
        return image
    }()
    
    lazy var titleView: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "O seu token é:"
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
        text.text = "expira em: 100"
        text.textColor = .systemGray
        return text
    }()
    
    lazy var button: UIButton = {
        let button = Buttons().buttonSmallAcToken()
        button.setTitle("Fechar", for: .normal)
        return button
    }()
    
    @objc func eventContDown() {
        countDown -= 1
        expiryText.text = "expira em: \(countDown)"
    }
}
