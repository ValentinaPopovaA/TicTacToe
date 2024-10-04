//
//  HowToPlayController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class HowToPlayController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
   private let howToPlayStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let firstRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let firstRuleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .secondary_purple
        label.textAlignment = .center
        label.layer.cornerRadius = 23
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstRuleTextView: UIView = {
        let view = UIView()
        view.backgroundColor = .basic_light_blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

   private let firstRuleTextLabel: UILabel = {
        let label = UILabel()
        label.text =  "Draw a grid with three rows and three columns, creating nine squares in total."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let secondRuleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .secondary_purple
        label.layer.cornerRadius = 23
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    private let secondRuleTextView: UIView = {
        let view = UIView()
        view.backgroundColor = .basic_light_blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondRuleTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let thirdRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let thirdRuleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thirdRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .secondary_purple
        label.layer.cornerRadius = 23
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let thirdRuleTextView: UIView = {
        let view = UIView()
        view.backgroundColor = .basic_light_blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thirdRuleTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fourthRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let fourthRuleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fourthRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .secondary_purple
        label.layer.cornerRadius = 23
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fourthRuleTextView: UIView = {
        let view = UIView()
        view.backgroundColor = .basic_light_blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fourthRuleTextLabel: UILabel = {
        let label = UILabel()
        label.text = "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5, 7."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: howToPlayStack.frame.width, height: howToPlayStack.frame.height + 200)
        setupUI()
        makeConstraints()
        title = "How to play"
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "icon-back")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        firstRuleTextView.layer.cornerRadius = 23
        secondRuleTextView.layer.cornerRadius = 23
        thirdRuleTextView.layer.cornerRadius = 23
        fourthRuleTextView.layer.cornerRadius = 23
    }
    
    private func setupUI() {
        view.backgroundColor = .basic_background
        view.addSubview(scrollView)
        scrollView.addSubview(howToPlayStack)

        howToPlayStack.addArrangedSubview(firstRuleStack)
        howToPlayStack.addArrangedSubview(secondRuleStack)
        howToPlayStack.addArrangedSubview(thirdRuleStack)
        howToPlayStack.addArrangedSubview(fourthRuleStack)
        
        firstRuleStack.addArrangedSubview(firstRuleLabel)
        firstRuleStack.addArrangedSubview(firstRuleView)
        firstRuleView.addSubview(firstRuleLabel)
        firstRuleStack.addArrangedSubview(firstRuleTextLabel)
        firstRuleStack.addArrangedSubview(firstRuleTextView)
        firstRuleTextView.addSubview(firstRuleTextLabel)

        secondRuleStack.addArrangedSubview(secondRuleLabel)
        secondRuleStack.addArrangedSubview(secondRuleView)
        secondRuleView.addSubview(secondRuleLabel)
        secondRuleStack.addArrangedSubview(secondRuleTextLabel)
        secondRuleStack.addArrangedSubview(secondRuleTextView)
        secondRuleTextView.addSubview(secondRuleTextLabel)
        
        thirdRuleStack.addArrangedSubview(thirdRuleLabel)
        thirdRuleStack.addSubview(thirdRuleView)
        thirdRuleView.addSubview(thirdRuleLabel)
        thirdRuleStack.addArrangedSubview(thirdRuleTextLabel)
        thirdRuleStack.addArrangedSubview(thirdRuleTextView)
        thirdRuleTextView.addSubview(thirdRuleTextLabel)
        
        fourthRuleStack.addArrangedSubview(fourthRuleLabel)
        fourthRuleStack.addArrangedSubview(fourthRuleView)
        fourthRuleView.addSubview(fourthRuleLabel)
        fourthRuleStack.addArrangedSubview(fourthRuleTextLabel)
        fourthRuleStack.addArrangedSubview(fourthRuleTextView)
        fourthRuleTextView.addSubview(fourthRuleTextLabel)
    }
    
    private func makeConstraints() {
        
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            howToPlayStack.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor,constant: 13),
            howToPlayStack.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -13),
            howToPlayStack.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            howToPlayStack.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            firstRuleLabel.heightAnchor.constraint(equalToConstant: 45),
            firstRuleLabel.widthAnchor.constraint(equalToConstant: 45),
            firstRuleLabel.leadingAnchor.constraint(equalTo: firstRuleView.leadingAnchor),
            firstRuleLabel.topAnchor.constraint(equalTo: firstRuleView.topAnchor),

            firstRuleTextView.trailingAnchor.constraint(equalTo: firstRuleStack.trailingAnchor, constant: -10),
            firstRuleTextView.leadingAnchor.constraint(equalTo: firstRuleView.leadingAnchor, constant: 50),
            firstRuleTextView.topAnchor.constraint(equalTo: firstRuleStack.topAnchor),
            firstRuleTextView.bottomAnchor.constraint(equalTo: firstRuleStack.bottomAnchor),
            
            firstRuleTextLabel.leadingAnchor.constraint(equalTo: firstRuleTextView.leadingAnchor, constant: 16),
            firstRuleTextLabel.trailingAnchor.constraint(equalTo: firstRuleTextView.trailingAnchor, constant: -16),
            firstRuleTextLabel.topAnchor.constraint(equalTo: firstRuleTextView.topAnchor, constant: 16),
            firstRuleTextLabel.bottomAnchor.constraint(equalTo: firstRuleTextView.bottomAnchor, constant: -16),

            secondRuleLabel.heightAnchor.constraint(equalToConstant: 45),
            secondRuleLabel.widthAnchor.constraint(equalToConstant: 45),
            secondRuleLabel.leadingAnchor.constraint(equalTo: secondRuleView.leadingAnchor),
            secondRuleLabel.topAnchor.constraint(equalTo: secondRuleView.topAnchor),
            
            secondRuleTextView.trailingAnchor.constraint(equalTo: secondRuleStack.trailingAnchor, constant: -10),
            secondRuleTextView.leadingAnchor.constraint(equalTo: secondRuleStack.leadingAnchor, constant: 50),
            secondRuleTextView.topAnchor.constraint(equalTo: secondRuleStack.topAnchor),
            secondRuleTextView.bottomAnchor.constraint(equalTo: secondRuleStack.bottomAnchor),
            
            secondRuleTextLabel.leadingAnchor.constraint(equalTo: secondRuleTextView.leadingAnchor, constant: 16),
            secondRuleTextLabel.trailingAnchor.constraint(equalTo: secondRuleTextView.trailingAnchor, constant: -16),
            secondRuleTextLabel.topAnchor.constraint(equalTo: secondRuleTextView.topAnchor, constant: 16),
            secondRuleTextLabel.bottomAnchor.constraint(equalTo: secondRuleTextView.bottomAnchor, constant: -16),
            
            thirdRuleLabel.heightAnchor.constraint(equalToConstant: 45),
            thirdRuleLabel.widthAnchor.constraint(equalToConstant: 45),
            thirdRuleLabel.leadingAnchor.constraint(equalTo: thirdRuleView.leadingAnchor),
            thirdRuleLabel.topAnchor.constraint(equalTo: thirdRuleView.topAnchor),
            
            thirdRuleTextView.trailingAnchor.constraint(equalTo: thirdRuleStack.trailingAnchor, constant: -10),
            thirdRuleTextView.leadingAnchor.constraint(equalTo: thirdRuleStack.leadingAnchor, constant: 50),
            thirdRuleTextView.topAnchor.constraint(equalTo: thirdRuleStack.topAnchor),
            thirdRuleTextView.bottomAnchor.constraint(equalTo: thirdRuleStack.bottomAnchor),
            
            thirdRuleTextLabel.leadingAnchor.constraint(equalTo: thirdRuleTextView.leadingAnchor, constant: 16),
            thirdRuleTextLabel.trailingAnchor.constraint(equalTo: thirdRuleTextView.trailingAnchor, constant: -16),
            thirdRuleTextLabel.topAnchor.constraint(equalTo: thirdRuleTextView.topAnchor, constant: 16),
            thirdRuleTextLabel.bottomAnchor.constraint(equalTo: thirdRuleTextView.bottomAnchor, constant: -16),
            
            fourthRuleLabel.heightAnchor.constraint(equalToConstant: 45),
            fourthRuleLabel.widthAnchor.constraint(equalToConstant: 45),
            fourthRuleLabel.leadingAnchor.constraint(equalTo: fourthRuleView.leadingAnchor),
            fourthRuleLabel.topAnchor.constraint(equalTo: fourthRuleView.topAnchor),
            
            fourthRuleTextView.trailingAnchor.constraint(equalTo: fourthRuleStack.trailingAnchor, constant: -10),
            fourthRuleTextView.leadingAnchor.constraint(equalTo: fourthRuleStack.leadingAnchor, constant: 50),
            fourthRuleTextView.topAnchor.constraint(equalTo: fourthRuleStack.topAnchor),
            fourthRuleTextView.bottomAnchor.constraint(equalTo: fourthRuleStack.bottomAnchor),
       
            fourthRuleTextLabel.leadingAnchor.constraint(equalTo: fourthRuleTextView.leadingAnchor, constant: 16),
            fourthRuleTextLabel.trailingAnchor.constraint(equalTo: fourthRuleTextView.trailingAnchor, constant: -16),
            fourthRuleTextLabel.topAnchor.constraint(equalTo: fourthRuleTextView.topAnchor, constant: 16),
            fourthRuleTextLabel.bottomAnchor.constraint(equalTo: fourthRuleTextView.bottomAnchor, constant: -16),
        ])
    }
}
