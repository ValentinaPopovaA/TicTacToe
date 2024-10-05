//
//  SoundManager.swift
//  TicTacToe
//
//  Created by Alexander Altman on 05.10.2024.
//

import AVFoundation
//???: How to use SoundManager
// to play sound on any VC just add
//SoundManager.sharedInstance.playSound(.win) or other sound name accessible thought dot

// to stop music just add where it's needed
// SoundManager.sharedInstance.stopSound()


protocol SoundManagerProtocol {
    func playSound(_ audio: Audio)
    func stopSound()
}

class SoundManager: SoundManagerProtocol {
    static let sharedInstance: SoundManager = {
        let soundPlayerFactory = SoundPlayerFactory()
        return SoundManager(soundPlayerFactory: soundPlayerFactory)
    }()

    private let soundPlayerFactory: SoundPlayerFactory
    private var soundPlayers: [Audio: AVAudioPlayer] = [:]

    init(soundPlayerFactory: SoundPlayerFactory) {
        self.soundPlayerFactory = soundPlayerFactory
    }
    
    func playSound(_ audio: Audio) {
        if let soundPlayer = soundPlayers[audio] {
            soundPlayer.play()
        } else {
            do {
                let soundPlayer = try AVAudioPlayer(contentsOf: audio.filePath)
                soundPlayer.prepareToPlay()
                soundPlayer.play()
                soundPlayers[audio] = soundPlayer
            } catch {
                print("Error creating sound player: \(error)")
            }
        }
    }
    
    func stopSound() {
        for (audio, soundPlayer) in soundPlayers {
            soundPlayer.stop()
        }
        soundPlayers.removeAll()
    }
}
