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
    private var availableCells: Set<Int> = Set(1...9)
    
    
    
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
    
    func moveMade(by player: PlayerFigure, at position: Int) -> RoundResult? {
        moveCounter += 1
        availableCells.remove(position)
        if player == .circle {
            playerOneCombination.insert(position)
        } else {
            playerTwoCombination.insert(position)
        }
        return getResult()
    }
    
    private func findWinningMove(for player: PlayerFigure) -> Int? {
        let currentCombination = player == .circle ? playerOneCombination : playerTwoCombination
        
        for combination in winningCombinations {
            let missingCells = combination.subtracting(currentCombination)
            
            if missingCells.count == 1, let move = missingCells.first, availableCells.contains(move) {
                return move
            }
        }
        
        return nil
    }
    
    private func chooseOptimalMove() -> Int? {
        if availableCells.contains(5) {
            return 5
        }
        
        let corners = [1, 3, 7, 9]
        let availableCorners = corners.filter { availableCells.contains($0) }
        
        if let cornerMove = availableCorners.randomElement() {
            return cornerMove
        }
        
        return availableCells.randomElement()
    }
    
    func getComputerMove() -> Int? {
        if let winningMove = findWinningMove(for: .cross) {
            return winningMove
        }

        if let blockingMove = findWinningMove(for: .circle) {
            return blockingMove
        }

        return chooseOptimalMove()
    }
}
