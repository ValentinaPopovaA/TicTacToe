//
//  Setting.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 02.10.2024.
//


enum GameMode {
    case singlePlayer
    case twoPlayer
}

enum GameDifficulty {
    case easy
    case standart
    case hard
}

struct Setting: Codable {
    let gameTime: Bool
    let duration: Int
    let musicEnable: Bool
    let selectedMusic: String
    let player1Image: String
    let player2Image: String
    let selectedPairNumber: Int
}
