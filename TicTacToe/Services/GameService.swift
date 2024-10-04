//
//  GameService.swift
//  TicTacToe
//
//  Created by nik on 03.10.24.
//

import Foundation

enum PlayerFigure {
    case circle
    case cross
}

enum RoundResult {
    case win
    case lose
    case draw
}

final class GameService {
    private let winningCombinations: [Set<Int>] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7]
    ]
    
    private var playerOneCombination: Set<Int> = []
    private var playerTwoCombination: Set<Int> = []
    private var moveCounter = 0
    
    
    
    let gameMode: GameMode
    let gameDifficulty: GameDifficulty
    
    init(gameMode: GameMode, gameDifficulty: GameDifficulty) {
        self.gameMode = gameMode
        self.gameDifficulty = gameDifficulty
    }
    
    private func getResult() -> RoundResult? {
        for combination in winningCombinations {
            if combination.isSubset(of: playerOneCombination) {
                return .win
            } else if combination.isSubset(of: playerTwoCombination) {
                return .lose
            } else if moveCounter == 9 {
                return .draw
            }
        }
        return nil
    }
    
    func moveMade(by player: PlayerFigure) -> RoundResult? {
        moveCounter += 1
        if player == .circle {
            playerOneCombination.insert(moveCounter)
        } else {
            playerTwoCombination.insert(moveCounter)
        }
        return getResult()
    }
}
