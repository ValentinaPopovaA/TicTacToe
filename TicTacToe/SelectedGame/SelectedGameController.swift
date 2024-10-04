//
//  SelectedGameController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class SelectedGameController: UIViewController {
    let selectGameStackView = UIStackView()
    var selectGameView: UIView = {
        let view = UIView()
        view.configureView(color: .white, applyShadow: true)
        return view
    }()
    lazy var selectGameLabel = UILabel.createLabel(
        text: "Select Game",
        fontSize: 24,
        isBold:true
    )
    lazy var singlePlayerButton = UIButton.makeCustomButtonWithImage(
        image: Images.single_player,
        label:"Single Player",
        target: self,
        action: #selector(goToDifficultySelection)
    )
    lazy var twoPlayersButton = UIButton.makeCustomButtonWithImage(
        image: Images.two_players,
        label: "Two Players",
        target: self,
        action: #selector(goToGameScreen)
    )
    lazy var leaderbordButton = UIButton.makeCustomButtonWithImage(
        image: Images.rocket,
        label: "Leaderboard",
        target: self,
        action: #selector(goToLeaderboard)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .basic_background
        
        selectGameStackView.addArrangedSubview(selectGameLabel)
        selectGameStackView.addArrangedSubview(singlePlayerButton)
        selectGameStackView.addArrangedSubview(twoPlayersButton)
        selectGameStackView.addArrangedSubview(leaderbordButton)
        selectGameStackView.axis = .vertical
        selectGameStackView.spacing = 20
        selectGameStackView.translatesAutoresizingMaskIntoConstraints = false
      
        view.addSubview(selectGameView)
     
        makeConstraints()
    }
    
    func makeConstraints() {
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
            twoPlayersButton.heightAnchor.constraint(equalToConstant: 69),
            leaderbordButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
  
    @objc func goToDifficultySelection() {
        let difficultySelectionVC = SelectedGameSecondController(gameMode: .singlePlayer)
        navigationController?.pushViewController(difficultySelectionVC, animated: true)
    }
    
    @objc func goToLeaderboard() {
        let leaderboardVC = LeaderboardViewController()
        navigationController?.pushViewController(leaderboardVC, animated: true)
    }
    
    @objc func goToGameScreen() {
        let gameVC = GameScreenViewController(gameMode: .twoPlayer, gameDifficulty: .easy)
        navigationController?.pushViewController(gameVC, animated: true)
    }
}

