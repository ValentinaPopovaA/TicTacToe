//
//  SelectedGameSecondController.swift
//  TicTacToe
//
//  Created by Алиса on 02.10.2024.
//

import UIKit

class SelectedGameSecondController: UIViewController {
    let selectGameStackView2 = UIStackView()
    var selectGameView2: UIView = {
        let view = UIView()
        view.configureView(color: .white, applyShadow: true)
        return view
    }()
    lazy var selectGameLabel2 = UILabel.createLabel(
        text: "Select Game",
        fontSize: 24,
        isBold:true
    )
    lazy var hardLevelButton = UIButton.makeCustomButtonWithLabel(
        label: "Hard",
        buttonColor: .basic_light_blue,
        textColor: .black,
        fontSize: 20,
        borderColor: .clear,
        target: self,
        action: #selector(goToGame)
    )
    lazy var standartLevelButton = UIButton.makeCustomButtonWithLabel(
        label: "Standart",
        buttonColor: .basic_light_blue,
        textColor: .black,
        fontSize: 20,
        borderColor: .clear,
        target: self,
        action: #selector(goToGame)
    )
    lazy var easyLevelButton = UIButton.makeCustomButtonWithLabel(
        label: "Easy",
        buttonColor: .basic_light_blue,
        textColor: .black,
        fontSize: 20,
        borderColor: .clear,
        target: self,
        action: #selector(goToGame)
    )
    
    private let gameMode: GameMode
    
    init(gameMode: GameMode) {
        self.gameMode = gameMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .basic_background
        
        hardLevelButton.tag = 3
        standartLevelButton.tag = 2
        easyLevelButton.tag = 1
        
        view.addSubview(selectGameView2)
        selectGameStackView2.addArrangedSubview(selectGameLabel2)
        selectGameStackView2.addArrangedSubview(hardLevelButton)
        selectGameStackView2.addArrangedSubview(standartLevelButton)
        selectGameStackView2.addArrangedSubview(easyLevelButton)
        selectGameStackView2.axis = .vertical
        selectGameStackView2.spacing = 20
        selectGameStackView2.translatesAutoresizingMaskIntoConstraints = false
        
        makeConstraints()
    }
    func makeConstraints() {
        selectGameView2.addSubview(selectGameStackView2)
        
        NSLayoutConstraint.activate([
            selectGameView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            selectGameView2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            selectGameView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            
            selectGameStackView2.leadingAnchor.constraint(equalTo: selectGameView2.leadingAnchor, constant: 20),
            selectGameStackView2.topAnchor.constraint(equalTo: selectGameView2.topAnchor, constant: 20),
            selectGameStackView2.trailingAnchor.constraint(equalTo: selectGameView2.trailingAnchor, constant: -20),
            selectGameStackView2.bottomAnchor.constraint(equalTo: selectGameView2.bottomAnchor, constant: -20),
            
            hardLevelButton.heightAnchor.constraint(equalToConstant: 69),
            standartLevelButton.heightAnchor.constraint(equalToConstant: 69),
            easyLevelButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
    
    @objc func goToGame(_ sender: UIButton) {
        let gameDifficulty: GameDifficulty
        switch sender.tag {
        case 3:
            gameDifficulty = .hard
        case 2:
            gameDifficulty = .standart
        case 1:
            gameDifficulty = .easy
        default:
            gameDifficulty = .hard
        }
        
        let gameVC = GameScreenViewController(gameMode: gameMode, gameDifficulty: gameDifficulty)
        navigationController?.pushViewController(gameVC, animated: true)
    }
}
