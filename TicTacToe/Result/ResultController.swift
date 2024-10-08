//
//  ResultController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

enum GameResult {
    case playerOneWin
    case playerTwoWin
    case playerWin
    case computerWin
    case draw
}

final class ResultController: UIViewController {
    
    // MARK: - Properties
    
    var gameResult: GameResult?
    
    lazy var label = UILabel.createLabel(text: "You Lose!", fontSize: 20, isBold: true)
    lazy var imageView = UIImageView.makeSimpleImage(image: Images.lose)
    lazy var playAgainButton = UIButton.makeCustomButtonWithLabel(label: "Play again",
                                                                  buttonColor: .basic_blue,
                                                                  textColor: .white,
                                                                  fontSize: 20,
                                                                  borderColor: .basic_blue,
                                                                  target: self,
                                                                  action: #selector(goToNewGame))
    lazy var backButton = UIButton.makeCustomButtonWithLabel(label: "Back",
                                                             buttonColor: .clear,
                                                             textColor: .basic_blue,
                                                             fontSize: 20,
                                                             borderColor: .basic_blue,
                                                             target: self,
                                                             action: #selector(backToSelectGame))
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .basic_white
        setViews()
        makeConstraints()
        updateResult()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear (animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if gameResult == .computerWin {
            SoundManager.sharedInstance.playSound(.loose)
        } else if gameResult == .draw {
            SoundManager.sharedInstance.playSound(.draw)
        } else {
            SoundManager.sharedInstance.playSound(.win)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear (animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Private Methods
    
    private func updateResult() {
        guard let result = gameResult else { return }
        
        switch result {
        case .playerOneWin:
            label.text = "Player One Win!"
            imageView.image = Images.win
        case .playerTwoWin:
            label.text = "Player Two Win!"
            imageView.image = Images.win
        case .playerWin:
            label.text = "You Win!"
            imageView.image = Images.win
        case .computerWin:
            label.text = "You Lose!"
            imageView.image = Images.lose
        case .draw:
            label.text = "Draw!"
            imageView.image = Images.handshake
        }
    }
    
    // MARK: - Actions
    @objc private func goToNewGame() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func backToSelectGame() {
        if let selectGameVC = navigationController?.viewControllers.first(where: { $0 is SelectedGameController }) {
            navigationController?.popToViewController(selectGameVC, animated: true)
        }
    }
}

// MARK: - Layout Configuration
private extension ResultController {
    func setViews() {
        view.addSubview(playAgainButton)
        view.addSubview(backButton)
        view.addSubview(label)
        view.addSubview(imageView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 60),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor),
            
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 72),
            
            playAgainButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playAgainButton.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
}
