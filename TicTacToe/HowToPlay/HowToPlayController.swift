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
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .red
        return stack
    }()
    
    let firstRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let firstRuleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = view.layer.bounds.width / 2
        view.clipsToBounds = true
        view.backgroundColor = UIColor().secondary_purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstRuleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstRuleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor().basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "Draw a grid with three rows and three columns, creating nine squares in total."
        textView.textColor = UIColor().basic_blue
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let secondRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let secondRuleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = view.layer.bounds.width / 2
        view.clipsToBounds = true
        view.backgroundColor = UIColor().secondary_purple
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
        textView.backgroundColor = UIColor().basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker."
        textView.textColor = UIColor().basic_blue
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let thirdRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let thirdRuleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = view.layer.bounds.width / 2
        view.clipsToBounds = true
        view.backgroundColor = UIColor().secondary_purple
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
        textView.backgroundColor = UIColor().basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends."
        textView.textColor = UIColor().basic_blue
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let fourthRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let fourthRuleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = view.layer.bounds.width / 2
        view.clipsToBounds = true
        view.backgroundColor = UIColor().secondary_purple
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
        textView.backgroundColor = UIColor().basic_light_blue
        textView.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        textView.text = "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5, 7."
        textView.textColor = UIColor().basic_blue
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpIU()
        makeConstraints()
        title = "How to play"
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "back")
    }
    
    func setUpIU() {
        view.backgroundColor = UIColor().basic_background
        view.addSubview(howToPlayStack)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            howToPlayStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            howToPlayStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            howToPlayStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            howToPlayStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
