//
//  LeaderboardService.swift
//  TicTacToe
//
//  Created by nik on 05.10.24.
//

import Foundation

final class LeaderboardService {
    static let shared = LeaderboardService()
    
    private init() {}
    
    func getTimeList() -> [Int] {
        UserDefaults.standard.array(forKey: "leaderboard") as? [Int] ?? []
    }
    
    func addLeader(_ time: Int) {
        let list = getTimeList()
        
        if !list.contains(time) {
            UserDefaults.standard.set(list + [time], forKey: "leaderboard")
        }
    }
}
