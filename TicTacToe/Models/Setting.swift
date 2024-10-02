//
//  Setting.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 02.10.2024.
//


enum gameMode {
    case singlePlayer
    case twoPlayer
}

struct Setting {
    let gameMode: gameMode
    let duration: Int
    let music: String
    let player1Image: String
    let palyer2Image: String
    
}
