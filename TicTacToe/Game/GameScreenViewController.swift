//
//  GameScreenViewController.swift
//  TicTacToe
//
//  Created by nik on 01.10.24.
//

import UIKit

final class GameScreenViewController: UIViewController {
    
    private let gameScreenView = GameScreenView()
    
    override func loadView() {
        view = gameScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.basic_background
        gameScreenView.delegate = self
    }
}

extension GameScreenViewController: GameScreenViewDelegate {
    func cellPressed(_ sender: UIButton) {
        print("Tapped cell № \(sender.tag)")
    }
}


