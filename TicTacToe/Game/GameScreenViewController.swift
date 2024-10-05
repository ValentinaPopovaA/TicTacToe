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
    private var timer = TimerService()
    
    private let gameSettings = GameSettings.shared.getSettingsLoad()
    private let gameMode: GameMode
    
    private let player1: Player
    private let player2: Player
    
    private var timeRemaining = 0
    
    init(gameMode: GameMode, gameDifficulty: GameDifficulty) {
        self.gameMode = gameMode
        self.gameService = GameService(gameDifficulty: gameDifficulty)
        
        player1 = Player(
            image: UIImage(named: gameSettings.player1Image) ?? UIImage.pair1Cross,
            name: gameMode == .singlePlayer ? "You" : "Player One"
        )
        player2 = Player(
            image: UIImage(named: gameSettings.player2Image) ?? UIImage.pair1Circle,
            name: gameMode == .singlePlayer ? "Computer" : "Player Two"
        )
        
        super.init(nibName: nil, bundle: nil)
        
        self.timer.delegate = self
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
        gameService = GameService(gameDifficulty: gameService.gameDifficulty)
        
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
        
        if gameSettings.gameTime {
            timeRemaining = gameSettings.duration
            gameScreenView.updateTimer(to: timeRemaining, UIColor.basic_black ?? .black)
        }
        
        enableBoard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if gameSettings.gameTime {
            timer.start()
        }
        
        if gameSettings.musicEnable {
            SoundManager.sharedInstance.playSound(
                Audio.giveAudioWith(name: gameSettings.selectedMusic) ?? .country,
                repeatSound: true
            )
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SoundManager.sharedInstance.stopSound()
    }
    
    private func performComputerMove() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            
            SoundManager.sharedInstance.playSound(.move)

            if let computerMove = self.gameService.getComputerMove() {
                if let button = self.gameScreenView.viewWithTag(computerMove) as? UIButton {
                    button.setImage(player2.image, for: .normal)
                    button.isUserInteractionEnabled = false

                    if let _ = self.gameService.moveMade(at: computerMove) {
                        self.timer.stop()
                        self.handleGameResult(.computerWin)
                    }
                    else {
                        self.enableBoard()
                        self.showTurn()
                    }
                }
            }
        }
    }
    
    private func handleGameResult(_ result: GameResult) {
        if gameSettings.gameTime && [.playerWin, .playerOneWin, .playerTwoWin].contains(result) {
            LeaderboardService.shared.addLeader(gameSettings.duration - timeRemaining)
        }
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
        
        SoundManager.sharedInstance.playSound(.move)
        
        let currentPlayer = gameService.currentTurn == .playerOne ? player1 : player2
        sender.setImage(currentPlayer.image, for: .normal)
        

        if let result = gameService.moveMade(at: sender.tag) {
            timer.stop()
                        
            switch result {
            case .playerOneWin:
                handleGameResult( gameMode == .singlePlayer ? .playerWin : .playerOneWin )
            case .playerTwoWin:
                handleGameResult( gameMode == .singlePlayer ? .computerWin : .playerTwoWin)
            case .draw:
                handleGameResult(.draw)
            }

        } else if gameMode == .singlePlayer {
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

extension GameScreenViewController: TimerServiceDelegate {
    func timerTick() {
        timeRemaining -= 1
        if timeRemaining <= 0 {
            gameScreenView.updateTimer(to: timeRemaining, .systemRed)
            timer.stop()
            
            if gameMode == .singlePlayer {
                handleGameResult(gameService.currentTurn == .playerOne ? .computerWin : .playerWin)
            } else {
                handleGameResult(gameService.currentTurn == .playerOne ? .playerTwoWin : .playerOneWin)
            }
            
        } else if timeRemaining <= 5 {
            gameScreenView.updateTimer(to: timeRemaining, .systemRed)
        } else {
            gameScreenView.updateTimer(to: timeRemaining, UIColor.basic_black ?? .black)
        }
    }
}


