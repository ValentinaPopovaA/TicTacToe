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
    let singlePlayerButton = UIButton(type: .custom)
    let twoPlayersButton = UIButton(type: .custom)
    
    
    
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
        
        singlePlayerButton.setImage(UIImage(named: "single_player"), for: .normal)
        singlePlayerButton.setTitle("Single Player", for: .normal)
        singlePlayerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        singlePlayerButton.setTitleColor(.basic_black, for: .normal)
        singlePlayerButton.addTarget(self, action: #selector(singlePlayerButtonTapped), for: .touchUpInside)
        singlePlayerButton.backgroundColor = .basic_light_blue
        singlePlayerButton.layer.cornerRadius = 30
        singlePlayerButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: -4)
        singlePlayerButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 4)
        
        twoPlayersButton.setImage(UIImage(named: "two_players"), for: .normal)
        twoPlayersButton.setTitle("Two Players", for: .normal)
        twoPlayersButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        twoPlayersButton.setTitleColor(.basic_black, for: .normal)
        twoPlayersButton.addTarget(self, action: #selector(twoPlayersButtonTapped), for: .touchUpInside)
        twoPlayersButton.backgroundColor = .basic_light_blue
        twoPlayersButton.layer.cornerRadius = 30
        twoPlayersButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
        twoPlayersButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
 
        
        selectGameStackView.addArrangedSubview(selectGameLabel)
        selectGameStackView.addArrangedSubview(singlePlayerButton)
        selectGameStackView.addArrangedSubview(twoPlayersButton)
        selectGameStackView.axis = .vertical
        selectGameStackView.spacing = 20

        
        makeConstraints()
    }
    
    
//    view.addSubview(selectGameStackView)
    
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
