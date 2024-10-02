//
//  ViewController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var label = UILabel.createLabel(text: "You Lose!", fontSize: 20, isBold: true)
    lazy var imageView = UIImageView.makeSimpleImage(image: Images.lose)
    lazy var playAgainButton = UIButton.makeCustomButtonWithLabel(label: "Play again", buttonColor: .basic_blue, textColor: .black, fontSize: 20, borderColor: .basic_blue, target: self, action: #selector(goToNextScreen))
//    lazy var backButton = UIButton.makeCustomButtonWithLabel(label: "Back", buttonColor: .clear, textColor: .basic_blue, fontSize: 20, borderColor: .basic_blue, target: self, action: #selector(goToNextScreen))
    
    lazy var firstView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()
    
    //    Пример с картинкой
    lazy var backButton = UIButton.makeCustomButtonWithImage(image: Images.two_players, label: "Two players", target: self, action: #selector(goToNextScreen))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        makeConstraints()
    }
    
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
        view.addSubview(firstView)
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
            
            firstView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            firstView.widthAnchor.constraint(equalToConstant: 250),
            firstView.heightAnchor.constraint(equalToConstant: 250),
            
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 72),
            
            playAgainButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playAgainButton.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
}
