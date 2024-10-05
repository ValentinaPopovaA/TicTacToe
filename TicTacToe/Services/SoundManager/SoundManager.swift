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
    func playSound(_ audio: Audio, repeatSound: Bool)
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
    
    func playSound(_ audio: Audio, repeatSound: Bool = false) {
        if let soundPlayer = soundPlayers[audio] {
            soundPlayer.play()
        } else {
            do {
                let soundPlayer = try AVAudioPlayer(contentsOf: audio.filePath)
                if repeatSound { soundPlayer.numberOfLoops = -1 }
                soundPlayer.prepareToPlay()
                soundPlayer.play()
                soundPlayers[audio] = soundPlayer
            } catch {
                print("Error creating sound player: \(error)")
            }
        }
    }
    
    func stopSound() {
        for (_, soundPlayer) in soundPlayers {
            soundPlayer.stop()
        }
        soundPlayers.removeAll()
    }
}
