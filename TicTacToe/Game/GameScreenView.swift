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
    private let playerOneBadge = PlayerBadgeView()
    private let playerTwoBadge = PlayerBadgeView()
    
    private let timerLabel = UILabel.createLabel(text: "", fontSize: 20, isBold: true, numberOfLines: 1)
    
    private let moveStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let moveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.robot
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let moveLabel = UILabel.createLabel(text: "", fontSize: 24, isBold: true)
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createGameCell(withTag tag: Int) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.basic_light_blue
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

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
    
    func configureBages(imageOne: UIImage, nameOne: String, imageTwo: UIImage, nameTwo: String) {
        playerOneBadge.configure(image: imageOne, name: nameOne)
        playerTwoBadge.configure(image: imageTwo, name: nameTwo)
    }
    
    func setMove(_ image: UIImage, _ text: String) {
        moveImageView.image = image
        moveLabel.text = text
    }
    
    func updateTimer(to time: Int, _ color: UIColor) {
        timerLabel.text = String(format: "%02i:%02i", (time / 60) % (60 * 60), time % 60)
        timerLabel.textColor = color
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
            moveImageView,
            moveLabel
        ].forEach { moveStack.addArrangedSubview($0) }
        
        [
            playerOneBadge,
            timerLabel,
            playerTwoBadge,
            moveStack,
            gameField,
            gameStack,
        ].forEach {
            addSubview($0)
        }
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            playerOneBadge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            playerOneBadge.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 17.0 ),
            playerOneBadge.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 103.0 / 390.0),
            playerOneBadge.heightAnchor.constraint(equalTo: playerOneBadge.widthAnchor),
            
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: playerOneBadge.centerYAnchor),
            
            playerTwoBadge.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -30.0),
            playerTwoBadge.topAnchor.constraint(equalTo: playerOneBadge.topAnchor),
            playerTwoBadge.widthAnchor.constraint(equalTo: playerOneBadge.widthAnchor),
            playerTwoBadge.heightAnchor.constraint(equalTo: playerOneBadge.widthAnchor),
            
            moveStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            moveStack.topAnchor.constraint(equalTo: playerOneBadge.bottomAnchor, constant: 45),
            
            moveImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 54.0 / 390.0 ),
            moveImageView.heightAnchor.constraint(equalTo: moveImageView.widthAnchor),
            
            gameField.topAnchor.constraint(equalTo: moveStack.bottomAnchor, constant: 45),
            gameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: (390.0 - 88.0) / 390.0),
            gameField.heightAnchor.constraint(equalTo: gameField.widthAnchor),
            
            gameStack.leadingAnchor.constraint(equalTo: gameField.leadingAnchor, constant: 20),
            gameStack.trailingAnchor.constraint(equalTo: gameField.trailingAnchor, constant: -20),
            gameStack.topAnchor.constraint(equalTo: gameField.topAnchor, constant: 20),
            gameStack.bottomAnchor.constraint(equalTo: gameField.bottomAnchor, constant: -20)
        ])
    }
}
