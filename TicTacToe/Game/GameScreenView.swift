//
//  GameScreenView.swift
//  TicTacToe
//
//  Created by nik on 01.10.24.
//

import UIKit

protocol GameScreenViewDelegate: AnyObject {
    func cellPressed(_ sender: UIButton)
}

final class GameScreenView: UIView {
    
    //MARK: - Dependencies
    weak var delegate: GameScreenViewDelegate?
    
    //MARK: - Private propirties
    private let gameField: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.basic_white
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.basic_shadow?.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 30
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let gameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var gameCells: [UIButton] = []
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstrains()
        setupTargetActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createGameCell(withTag tag: Int) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.basic_light_blue
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.tag = tag
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func createHorizontalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    private func createPlayerBadge(_ image: UIImage, _ name: String) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.basic_light_blue
        view.layer.cornerRadius = 30
        //view.layer.masksToBounds = true
        
        
        
        return view
    }
}

// MARK: - Selectors
private extension GameScreenView {
    @objc func cellPressed(_ sender: UIButton) {
        delegate?.cellPressed(sender)
    }
}

//MARK: - Setup UI
private extension GameScreenView {
    func setupViews() {
        for row in 0...2 {
            let currentRow = createHorizontalStack()
            for column in 1...3 {
                let gameCell = createGameCell(withTag: row * 3 + column)
                gameCell.addTarget(self, action: #selector(cellPressed), for: .touchUpInside)
                gameCells.append(gameCell)
                currentRow.addArrangedSubview(gameCell)
            }
            gameStack.addArrangedSubview(currentRow)
        }
        
        [
            gameField,
            gameStack
        ].forEach {
            addSubview($0)
        }
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            gameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameField.centerYAnchor.constraint(equalTo: centerYAnchor),
            gameField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: (390.0 - 88.0)/390.0),
            gameField.heightAnchor.constraint(equalTo: gameField.widthAnchor),
            
            gameStack.leadingAnchor.constraint(equalTo: gameField.leadingAnchor, constant: 20),
            gameStack.trailingAnchor.constraint(equalTo: gameField.trailingAnchor, constant: -20),
            gameStack.topAnchor.constraint(equalTo: gameField.topAnchor, constant: 20),
            gameStack.bottomAnchor.constraint(equalTo: gameField.bottomAnchor, constant: -20)
        ])
    }
    
    func setupTargetActions() {
        
    }
}
