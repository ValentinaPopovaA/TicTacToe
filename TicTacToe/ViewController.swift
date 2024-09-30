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
    
    lazy var firstButton = UIButton.makeCustomButtonWithLabel(label: "Play again", buttonColor: .basic_blue, textColor: .white, fontSize: 20, borderColor: .basic_blue, target: self, action: #selector(goToNextScreen))
    lazy var secondButton = UIButton.makeCustomButtonWithLabel(label: "Back", buttonColor: .clear, textColor: .basic_blue, fontSize: 20, borderColor: .basic_blue, target: self, action: #selector(goToNextScreen))
    
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
        view.addSubview(firstButton)
        view.addSubview(secondButton)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            secondButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            secondButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            secondButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondButton.heightAnchor.constraint(equalToConstant: 72),
            
            firstButton.bottomAnchor.constraint(equalTo: secondButton.topAnchor, constant: -20),
            firstButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            firstButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            firstButton.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
}
