//
//  HowToPlayController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class HowToPlayController: UIViewController {
    
    let howToPlayStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let firstRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let firstRuleView: UIView = {
        let view = UIView()
        view.configureCircularView(size: 45)
        return view
    }()
    
    let firstRuleLabel: UILabel = {
        UILabel.createLabel(text: "1", fontSize: 22)
    }()
    
    let firstRuleTextView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()

    let firstRuleTextLabel: UILabel = {
        UILabel.createLabel(text: "Draw a grid with three rows and three columns, creating nine squares in total.", fontSize: 18, textAlignment: .left)
    }()
    
    let secondRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let secondRuleView: UIView = {
        let view = UIView()
        view.configureCircularView(size: 45)
        return view
    }()
    
    let secondRuleLabel: UILabel = {
        UILabel.createLabel(text: "2", fontSize: 20)
    }()
    
    let secondRuleTextView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()
    
    let secondRuleTextLabel: UILabel = {
        UILabel.createLabel(text: "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker.", fontSize: 18, textAlignment: .left)
    }()
    
    let thirdRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal

        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let thirdRuleView: UIView = {
        let view = UIView()
        view.configureCircularView(size: 45)
        return view
    }()
    
    let thirdRuleLabel: UILabel = {
        UILabel.createLabel(text: "3", fontSize: 20)
    }()

    let thirdRuleTextView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()
    
    let thirdRuleTextLabel: UILabel = {
        UILabel.createLabel(text: "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends.", fontSize: 18, textAlignment: .left)
    }()
    
    let fourthRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let fourthRuleView: UIView = {
        let view = UIView()
        view.configureCircularView(size: 45)
        return view
    }()
    
    let fourthRuleLabel: UILabel = {
        UILabel.createLabel(text: "4", fontSize: 20)
    }()

    let fourthRuleTextView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()
    
    let fourthRuleTextLabel: UILabel = {
        UILabel.createLabel(text:"The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5, 7.", fontSize: 18, textAlignment: .left)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
        title = "How to play"
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "icon-back")
    }
    
    func setupUI() {
        view.backgroundColor = .basic_background
        view.addSubview(howToPlayStack)
        howToPlayStack.addArrangedSubview(firstRuleStack)
        firstRuleStack.addArrangedSubview(firstRuleView)
        firstRuleView.addSubview(firstRuleLabel)
        firstRuleStack.addArrangedSubview(firstRuleTextView)
        firstRuleTextView.addSubview(firstRuleTextLabel)

                
        howToPlayStack.addArrangedSubview(secondRuleStack)
        secondRuleStack.addArrangedSubview(secondRuleView)
        secondRuleView.addSubview(secondRuleLabel)
        secondRuleStack.addArrangedSubview(secondRuleTextView)
        secondRuleTextView.addSubview(secondRuleTextLabel)
        
        howToPlayStack.addArrangedSubview(thirdRuleStack)
        thirdRuleStack.addArrangedSubview(thirdRuleView)
        thirdRuleView.addSubview(thirdRuleLabel)
        thirdRuleStack.addArrangedSubview(thirdRuleTextView)
        thirdRuleTextView.addSubview(thirdRuleTextLabel)
        
        howToPlayStack.addArrangedSubview(fourthRuleStack)
        fourthRuleStack.addArrangedSubview(fourthRuleView)
        fourthRuleView.addSubview(fourthRuleLabel)
        fourthRuleStack.addArrangedSubview(fourthRuleTextView)
        fourthRuleTextView.addSubview(fourthRuleTextLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            howToPlayStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 13),
            howToPlayStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            howToPlayStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            firstRuleLabel.centerYAnchor.constraint(equalTo: firstRuleView.centerYAnchor),
            firstRuleLabel.centerXAnchor.constraint(equalTo: firstRuleView.centerXAnchor),
            
            firstRuleTextLabel.leadingAnchor.constraint(equalTo: firstRuleTextView.leadingAnchor),
            firstRuleTextLabel.trailingAnchor.constraint(equalTo: firstRuleTextView.trailingAnchor),
            firstRuleTextLabel.topAnchor.constraint(equalTo: firstRuleTextView.topAnchor),
            firstRuleTextLabel.bottomAnchor.constraint(equalTo: firstRuleTextView.bottomAnchor),
            
            secondRuleView.widthAnchor.constraint(equalToConstant: 45),
            secondRuleView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),

            secondRuleLabel.centerYAnchor.constraint(equalTo: secondRuleView.centerYAnchor),
            secondRuleLabel.centerXAnchor.constraint(equalTo: secondRuleView.centerXAnchor),
            
            secondRuleTextLabel.leadingAnchor.constraint(equalTo: secondRuleTextView.leadingAnchor),
            secondRuleTextLabel.trailingAnchor.constraint(equalTo: secondRuleTextView.trailingAnchor),
            secondRuleTextLabel.topAnchor.constraint(equalTo: secondRuleTextView.topAnchor),
            secondRuleTextLabel.bottomAnchor.constraint(equalTo: secondRuleTextView.bottomAnchor),
            
            thirdRuleView.widthAnchor.constraint(equalToConstant: 45),
            thirdRuleView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),

            thirdRuleLabel.centerYAnchor.constraint(equalTo: thirdRuleView.centerYAnchor),
            thirdRuleLabel.centerXAnchor.constraint(equalTo: thirdRuleView.centerXAnchor),
            
            thirdRuleTextLabel.leadingAnchor.constraint(equalTo: thirdRuleTextView.leadingAnchor),
            thirdRuleTextLabel.trailingAnchor.constraint(equalTo: thirdRuleTextView.trailingAnchor),
            thirdRuleTextLabel.topAnchor.constraint(equalTo: thirdRuleTextView.topAnchor),
            thirdRuleTextLabel.bottomAnchor.constraint(equalTo: thirdRuleTextView.bottomAnchor),

            fourthRuleView.widthAnchor.constraint(equalToConstant: 45),
            fourthRuleView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            
            fourthRuleTextLabel.leadingAnchor.constraint(equalTo: fourthRuleTextView.leadingAnchor),
            fourthRuleTextLabel.trailingAnchor.constraint(equalTo: fourthRuleTextView.trailingAnchor),
            fourthRuleTextLabel.topAnchor.constraint(equalTo: fourthRuleTextView.topAnchor),
            fourthRuleTextLabel.bottomAnchor.constraint(equalTo: fourthRuleTextView.bottomAnchor),

            fourthRuleLabel.centerYAnchor.constraint(equalTo: fourthRuleView.centerYAnchor),
            fourthRuleLabel.centerXAnchor.constraint(equalTo: fourthRuleView.centerXAnchor),
        ])
    }
}
