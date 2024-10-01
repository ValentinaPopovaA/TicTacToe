//
//  SelectedGameController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class SelectedGameController: UIViewController {
    let selectGameView = UIView()
    let selectGameStackView = UIStackView()
    let selectGameLabel = UILabel()
    var singlePlayerButton = UIButton(type: .custom)
    var twoPlayersButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .basic_background
        
        selectGameView.layer.backgroundColor = UIColor.basic_white.cgColor
        selectGameView.layer.cornerRadius = 30
        view.addSubview(selectGameView)
        selectGameView.layer.shadowColor = UIColor(red: 0.604, green: 0.624, blue: 0.765, alpha: 0.3).cgColor
        selectGameView.layer.shadowRadius = 30
        selectGameView.layer.shadowOpacity = 1
        selectGameView.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        selectGameLabel.text = "Select Game"
        selectGameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        selectGameLabel.textAlignment = .center
        selectGameLabel.textColor = .basic_black
        
        singlePlayerButton = UIButton.makeCustomButtonWithImage(
            image: UIImage(named: "single_player"),
            label: "Single Player",
            target: self,
            action: #selector(singlePlayerButtonTapped)
        )
        singlePlayerButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: -4)
        singlePlayerButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 4)
        
        twoPlayersButton = UIButton.makeCustomButtonWithImage(
            image: UIImage(named: "two_players"),
            label: "Two Players",
            target: self,
            action: #selector(twoPlayersButtonTapped)
        )
        twoPlayersButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
        twoPlayersButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        
        selectGameStackView.addArrangedSubview(selectGameLabel)
        selectGameStackView.addArrangedSubview(singlePlayerButton)
        selectGameStackView.addArrangedSubview(twoPlayersButton)
        selectGameStackView.axis = .vertical
        selectGameStackView.spacing = 20
        
        makeConstraints()
    }
    
    func makeConstraints() {
        selectGameView.translatesAutoresizingMaskIntoConstraints = false
        selectGameStackView.translatesAutoresizingMaskIntoConstraints = false
        selectGameView.addSubview(selectGameStackView)
        
        NSLayoutConstraint.activate([
            selectGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            selectGameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            selectGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            
            selectGameStackView.leadingAnchor.constraint(equalTo: selectGameView.leadingAnchor, constant: 20),
            selectGameStackView.topAnchor.constraint(equalTo: selectGameView.topAnchor, constant: 20),
            selectGameStackView.trailingAnchor.constraint(equalTo: selectGameView.trailingAnchor, constant: -20),
            selectGameStackView.bottomAnchor.constraint(equalTo: selectGameView.bottomAnchor, constant: -20),
            
            singlePlayerButton.heightAnchor.constraint(equalToConstant: 69),
            twoPlayersButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
    
    @objc func singlePlayerButtonTapped() {
        print ("single")
    }
    
    @objc func twoPlayersButtonTapped() {
        print ("two")
    }
}
