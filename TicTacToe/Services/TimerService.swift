//
//  TimerService.swift
//  TicTacToe
//
//  Created by nik on 05.10.24.
//

import Foundation

protocol TimerServiceDelegate: AnyObject {
    func timerTick()
}

final class TamerService {
    private var timer: Timer?
    private let timeInterval: TimeInterval = 1.0
    
    weak var delegate: TimerServiceDelegate?
    
    func start() {
        stop()
        
        timer = Timer.scheduledTimer(
            timeInterval: timeInterval,
            target: self,
            selector: #selector(timerTick),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    @objc private func timerTick() {
        delegate?.timerTick()
    }
    
    deinit {
        stop()
    }
}
