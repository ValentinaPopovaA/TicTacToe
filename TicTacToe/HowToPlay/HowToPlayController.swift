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
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let firstRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.distribution = .fill
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let firstRuleView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondary_purple
        view.contentMode = .topLeft
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstRuleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        label.text = "1"
        label.textColor = .basic_black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    let firstRuleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "Draw a grid with three rows and three columns, creating nine squares in total."
        textView.textColor = .basic_black
        textView.layer.cornerRadius = 30
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let secondRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.distribution = .fill
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let secondRuleView: UIView = {
        let view = UIView()
//        view.layer.cornerRadius = view.layer.bounds.width / 2
//        view.clipsToBounds = true
        view.backgroundColor = .secondary_purple
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    let secondRuleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        label.text = "2"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let secondRuleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker."
        textView.textColor = .basic_black
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let thirdRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.distribution = .fill
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let thirdRuleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = view.layer.bounds.width / 2
        view.clipsToBounds = true
        view.backgroundColor = .secondary_purple
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let thirdRuleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        label.text = "3"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    let thirdRuleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends."
        textView.textColor = .basic_black
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let fourthRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.distribution = .fill
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let fourthRuleView: UIView = {
        let view = UIView()
//        view.layer.cornerRadius = view.layer.bounds.width / 2
//        view.clipsToBounds = true
        view.backgroundColor = .secondary_purple
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let fourthRuleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        label.text = "4"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    let fourthRuleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5, 7."
        textView.textColor = .basic_black
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
        title = "How to play"
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "back-item")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstRuleView.layer.cornerRadius = firstRuleView.layer.bounds.width / 2
        firstRuleView.clipsToBounds = true
    }
    
    func setupUI() {
        view.backgroundColor = .basic_background
        view.addSubview(howToPlayStack)
        howToPlayStack.addArrangedSubview(firstRuleStack)
        firstRuleStack.addArrangedSubview(firstRuleView)
        firstRuleView.addSubview(firstRuleLabel)
        firstRuleStack.addArrangedSubview(firstRuleTextView)
        
        howToPlayStack.addArrangedSubview(secondRuleStack)
//        secondRuleStack.addArrangedSubview(secondRuleView)
//        secondRuleView.addSubview(secondRuleLabel)
//        secondRuleStack.addArrangedSubview(secondRuleTextView)
//        
//        howToPlayStack.addArrangedSubview(thirdRuleStack)
//        thirdRuleStack.addArrangedSubview(thirdRuleView)
//        thirdRuleView.addSubview(thirdRuleLabel)
//        thirdRuleStack.addArrangedSubview(thirdRuleTextView)
//        
//        howToPlayStack.addArrangedSubview(fourthRuleStack)
//        fourthRuleStack.addArrangedSubview(fourthRuleView)
//        fourthRuleView.addSubview(fourthRuleLabel)
//        fourthRuleStack.addArrangedSubview(fourthRuleTextView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            howToPlayStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 13),
            howToPlayStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            howToPlayStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            howToPlayStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
          
            firstRuleStack.leadingAnchor.constraint(equalTo: howToPlayStack.leadingAnchor),
            firstRuleStack.trailingAnchor.constraint(equalTo: howToPlayStack.trailingAnchor),
            firstRuleStack.topAnchor.constraint(equalTo: howToPlayStack.topAnchor),
            firstRuleStack.heightAnchor.constraint(equalToConstant: 84),
            
//            firstRuleView.heightAnchor.constraint(equalToConstant: 45),
//            firstRuleView.widthAnchor.constraint(equalToConstant: 45),
//            firstRuleView.bottomAnchor.constraint(equalTo: firstRuleStack.topAnchor, constant: 30),
            
            firstRuleLabel.centerYAnchor.constraint(equalTo: firstRuleView.centerYAnchor),
            firstRuleLabel.centerXAnchor.constraint(equalTo: firstRuleView.centerXAnchor),
            
            firstRuleTextView.trailingAnchor.constraint(equalTo: firstRuleStack.trailingAnchor),
            firstRuleTextView.widthAnchor.constraint(equalTo: firstRuleStack.widthAnchor, constant: -80),
            
            secondRuleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondRuleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondRuleStack.heightAnchor.constraint(equalToConstant: 192),
            
//            secondRuleTextView.trailingAnchor.constraint(equalTo: secondRuleStack.trailingAnchor),

//            
//            thirdRuleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            thirdRuleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            thirdRuleStack.heightAnchor.constraint(equalToConstant: 171),
//
//            fourthRuleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            fourthRuleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            fourthRuleStack.bottomAnchor.constraint(equalTo:howToPlayStack.bottomAnchor),
        ])
    }
}
