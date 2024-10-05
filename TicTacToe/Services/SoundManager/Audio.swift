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

enum Audio: String, CaseIterable {
    case win = "win"
    case loose = "loose"
    case country = "country"
    case donkey = "donkey"
    case neighbour = "neighbour"
    case move = "move"
    
    var filePath: URL {
        URL(fileURLWithPath: Bundle.main.path(forResource: self.rawValue, ofType: "mp3") ?? "")
    }
    
    static func giveAudioWith(name: String) -> Audio? {
        for audio in Audio.allCases {
            if audio.rawValue == name {
                return audio
            }
        }
        
        return nil
    }
}
