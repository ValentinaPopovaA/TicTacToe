//
//  GameService.swift
//  TicTacToe
//
//  Created by nik on 03.10.24.
//

import Foundation

enum Turn {
    case playerOne
    case playerTwo
    
    mutating func tonggle() {
        self = self == .playerOne ? .playerTwo : .playerOne
    }
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
    private(set) var currentTurn = Turn.playerOne
    
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
    
    func moveMade(at position: Int) -> RoundResult? {
        moveCounter += 1
        availableCells.remove(position)
        if currentTurn == .playerOne {
            playerOneCombination.insert(position)
        } else {
            playerTwoCombination.insert(position)
        }
        currentTurn.tonggle()
        return getResult()
    }
    
    func getComputerMove() -> Int? {
        switch gameDifficulty {
        case .easy:
            return getRandomMove()
        case .standart:
            return getMediumMove()
        case .hard:
            return getHardMove()
        }
    }
    
    private func getRandomMove() -> Int? {
        return availableCells.randomElement()
    }
    
    private func getMediumMove() -> Int? {
        if let blokingMove = findWinningMove(for: .playerOne) {
            return blokingMove
        }
        return getRandomMove()
    }
    
    private func getHardMove() -> Int? {
        if let winningMove = findWinningMove(for: .playerTwo) {
            return winningMove
        }

        if let blockingMove = findWinningMove(for: .playerOne) {
            return blockingMove
        }

        return chooseOptimalMove()
    }
    
    private func findWinningMove(for player: Turn) -> Int? {
        let currentCombination = player == .playerOne ? playerOneCombination : playerTwoCombination
        
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

        if let corner = Set([1, 3, 7, 9]).intersection(availableCells).randomElement() {
            return corner
        }

        return availableCells.randomElement()
    }
}
