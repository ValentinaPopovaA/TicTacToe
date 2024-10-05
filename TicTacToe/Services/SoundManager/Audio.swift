//
//  Audio.swift
//  TicTacToe
//
//  Created by Alexander Altman on 05.10.2024.
//

import Foundation

//???: How to add sounds
// 1. add files in mp3 to the Sounds folder in Assets
// 2. add new case to the Audio Enum

enum Audio: String {
    case win = "win"
    case loose = "loose"
    
    var filePath: URL {
        URL(fileURLWithPath: Bundle.main.path(forResource: self.rawValue, ofType: "mp3") ?? "")
    }
}
