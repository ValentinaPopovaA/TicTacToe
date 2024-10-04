//
//  GameScreenViewController.swift
//  TicTacToe
//
//  Created by nik on 01.10.24.
//

import UIKit

struct Player {
    let image: UIImage
    let name: String
}

final class GameScreenViewController: UIViewController {
    
    private let gameScreenView = GameScreenView()
    private var gameService: GameService
    
    private let gameSettings = GameSettings.shared.getSettingsLoad()
    
    private let player1: Player
    private let player2: Player
    
    init(gameMode: GameMode, gameDifficulty: GameDifficulty) {
        self.gameService = GameService(gameMode: gameMode, gameDifficulty: gameDifficulty)
        player1 = Player(
            image: UIImage(named: gameSettings.player1Image) ?? UIImage.pair1Cross,
            name: gameService.gameMode == .singlePlayer ? "You" : "Player One"
        )
        player2 = Player(
            image: UIImage(named: gameSettings.palyer2Image) ?? UIImage.pair1Circle,
            name: gameService.gameMode == .singlePlayer ? "Computer" : "Player Two"
        )
        
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
        gameService = GameService(
            gameMode: gameService.gameMode,
            gameDifficulty: gameService.gameDifficulty
        )
        
        gameScreenView.configureBages(
            imageOne: player1.image,
            nameOne: player1.name,
            imageTwo: player2.image,
            nameTwo: player2.name
        )
        gameScreenView.setMove(player1.image, "\(player1.name) turn")
        
        for tag in 1...9 {
            if let button = gameScreenView.viewWithTag(tag) as? UIButton {
                button.setImage(nil, for: .normal)
            }
        }
        
        enableBoard()
    }
    
    private func performComputerMove() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }

            if let computerMove = self.gameService.getComputerMove() {
                if let button = self.gameScreenView.viewWithTag(computerMove) as? UIButton {
                    button.setImage(player2.image, for: .normal)
                    button.isUserInteractionEnabled = false

                    let result = self.gameService.moveMade(at: computerMove)

                    if let gameResult = result {
                        self.handleGameResult(gameResult)
                    }
                    else {
                        self.enableBoard()
                        self.showTurn()
                    }
                }
            }
        }
    }
    
    private func handleGameResult(_ result: RoundResult) {
        let resultVC = ResultController()
        resultVC.gameResult = result
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    private func disableBoard() {
        for tag in 1...9 {
            if let button = gameScreenView.viewWithTag(tag) as? UIButton {
                button.isUserInteractionEnabled = false
            }
        }
    }
    
    private func enableBoard() {
        for tag in 1...9 {
            if let button = gameScreenView.viewWithTag(tag) as? UIButton {
                if button.currentImage == nil {
                    button.isUserInteractionEnabled = true
                }
            }
        }
    }
}

extension GameScreenViewController: GameScreenViewDelegate {
    func cellPressed(_ sender: UIButton) {
        disableBoard()
        
        let currentPlayer = gameService.currentTurn == .playerOne ? player1 : player2
        sender.setImage(currentPlayer.image, for: .normal)
        

        if let result = gameService.moveMade(at: sender.tag) {
            handleGameResult(result)
        } else if gameService.gameMode == .singlePlayer {
            showTurn()
            performComputerMove()
        } else {
            showTurn()
            enableBoard()
        }
    }
    
    func showTurn() {
        let currentPlayer = gameService.currentTurn == .playerOne ? player1 : player2
        gameScreenView.setMove(currentPlayer.image, "\(currentPlayer.name) turn")
    }
}


