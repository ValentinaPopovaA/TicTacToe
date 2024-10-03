//
//  GameSettings.swift
//  TicTacToe
//
//  Created by nik on 03.10.24.
//

import Foundation

final class GameSettings {
    static let shared = GameSettings()
    
    private var defaultSettings: Setting
    
    private init () {
        defaultSettings = Setting(
            gameMode: gameMode.singlePlayer,
            gameTime: false,
            duration: 30,
            music: false,
            selectedMusic: "",
            player1Image: "x_pair1",
            palyer2Image: "o_pair1",
            selectedPairNumber: 1
        )
    }

    func getSettingsLoad() -> Setting {
        let decoder = JSONDecoder()
        
        if let gameSettings = UserDefaults.standard.data(forKey: "gameSettings"),
           let settings = try? decoder.decode(Setting.self, from: gameSettings) {
            return settings
        }
        
        return defaultSettings
    }
    
    func saveSettings(_ settings: Setting) {
        let encoder = JSONEncoder()
        if let encodedGameSettings = try? encoder.encode(settings) {
            UserDefaults.standard.set(encodedGameSettings, forKey: "gameSettings")
        }
    }
}
