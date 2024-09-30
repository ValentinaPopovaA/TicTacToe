//
//  ViewController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        makeConstraints()
    }
    
    lazy var label = UILabel.createLabel(text: "You Lose!", fontSize: 20, isBold: true)
    lazy var imageView = UIImageView.makeSimpleImage(imageName: "lose")
    lazy var playAgainButton = UIButton.makeCustomButtonWithLabel(label: "Play again", buttonColor: .basic_blue, textColor: .white, fontSize: 20, borderColor: .basic_blue, target: self, action: #selector(goToNextScreen))
    lazy var backButton = UIButton.makeCustomButtonWithLabel(label: "Back", buttonColor: .clear, textColor: .basic_blue, fontSize: 20, borderColor: .basic_blue, target: self, action: #selector(goToNextScreen))
    
//    Пример с картинкой
//    let icon = UIImage(named: "two_players")
//    lazy var secondButton = UIButton.makeCustomButtonWithImage(image: icon!, label: "Two players", target: self, action: #selector(goToNextScreen))
    
    
    @objc func goToNextScreen() {
        let vc = NextVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

private extension ViewController {
    func setViews() {
        view.addSubview(playAgainButton)
        view.addSubview(backButton)
        view.addSubview(label)
        view.addSubview(imageView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 60),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor),
            
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 72),
            
            playAgainButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20),
            playAgainButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            playAgainButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            playAgainButton.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
}
