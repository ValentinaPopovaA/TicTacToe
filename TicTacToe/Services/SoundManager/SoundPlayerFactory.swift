//
//  SoundPlayerFactory.swift
//  TicTacToe
//
//  Created by Alexander Altman on 05.10.2024.
//

import AVFoundation

class SoundPlayerFactory {
    func createSoundPlayer() -> AVAudioPlayer {
        do {
            let soundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ""))
            return soundPlayer
        } catch {
            print("Error creating sound player: \(error)")
            return AVAudioPlayer()
        }
    }
}
