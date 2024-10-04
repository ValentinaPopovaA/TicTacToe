//
//  GameScreenViewController.swift
//  TicTacToe
//
//  Created by nik on 01.10.24.
//

import UIKit

final class GameScreenViewController: UIViewController {
    
    private let gameScreenView = GameScreenView()
    private let gameService: GameService
    
    private let gameSettings = GameSettings.shared.getSettingsLoad()
    
    init(gameMode: GameMode, gameDifficulty: GameDifficulty) {
        self.gameService = GameService(gameMode: gameMode, gameDifficulty: gameDifficulty)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = gameScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.basic_background
        gameScreenView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameScreenView.configureBages(
            imageOne: UIImage(named: gameSettings.player1Image) ?? UIImage.singlePlayer,
            nameOne: gameService.gameMode == .singlePlayer ? "You" : "Player One",
            imageTwo: UIImage(named: gameSettings.palyer2Image) ?? UIImage.rocket,
            nameTwo: gameService.gameMode == .singlePlayer ? "Computer" : "Player Two"
        )
    }
}

extension GameScreenViewController: GameScreenViewDelegate {
    func cellPressed(_ sender: UIButton) {
        print("Tapped cell № \(sender.tag)")
        
        sender.isUserInteractionEnabled = false
        sender.setImage(UIImage.pair1Circle, for: .normal)
    }
}


