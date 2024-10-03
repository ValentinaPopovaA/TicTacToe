//
//  Setting.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 02.10.2024.
//


enum gameMode: Codable {
    case singlePlayer
    case twoPlayer
}

struct Setting: Codable {
    let gameMode: gameMode
    let gameTime: Bool
    let duration: Int
    let music: Bool
    let selectedMusic: String
    let player1Image: String
    let palyer2Image: String
    let selectedPairNumber: Int
}
