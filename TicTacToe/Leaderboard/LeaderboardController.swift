//
//  LeaderboardController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 02.10.2024.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    var leaderboardData = [Int]()
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let messageLabel = UILabel.createLabel(text: "No game history\nwith turn on time", fontSize: 20)
    let imageView = UIImageView.makeSimpleImage(image: Images.robot)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .basic_background
        
        title = "Leaderboard"
        
        if leaderboardData.isEmpty {
            showNoDataView()
        } else {
            configureScrollView()
            configureStackView()
            addLeaderboardEntries()
        }
    }
    
    private func showNoDataView() {
        setViews()
        makeConstraints()
    }
    
    private func setViews() {
        view.addSubview(messageLabel)
        view.addSubview(imageView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            messageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
    }
    
    private func addLeaderboardEntries() {
        leaderboardData.sort()
        
        let bestTime = leaderboardData.first ?? 0
        
        for (index, timeInSeconds) in leaderboardData.enumerated() {
            let formattedTime = formatTime(seconds: timeInSeconds)
            let isBest = timeInSeconds == bestTime
            let timePrefix = isBest ? "Best time" : "Time"
            let leaderboardStack = createLeaderboardEntry(number: index + 1, time: formattedTime, isBest: isBest, timePrefix: timePrefix)
            stackView.addArrangedSubview(leaderboardStack)
        }
    }
    
    private func createLeaderboardEntry(number: Int, time: String, isBest: Bool, timePrefix: String) -> UIStackView {
        let entryStack = UIStackView()
        entryStack.axis = .horizontal
        entryStack.spacing = 10
        entryStack.alignment = .center
        
        let numberView = createNumberView(with: number, isBest: isBest)
        let timeView = createTimeView(with: time, isBest: isBest, timePrefix: timePrefix)
        
        entryStack.addArrangedSubview(numberView)
        entryStack.addArrangedSubview(timeView)
        
        return entryStack
    }
    
    private func createNumberView(with number: Int, isBest: Bool) -> UIView {
        let numberView = UIView()
        numberView.configureCircularView(size: 69)
        numberView.backgroundColor = isBest ? .secondary_purple : .basic_light_blue
        
        let numberLabel = UILabel.createLabel(text: "\(number)", fontSize: 20)
        numberView.addSubview(numberLabel)
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: numberView.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: numberView.centerYAnchor)
        ])
        
        return numberView
    }
    
    private func createTimeView(with time: String, isBest: Bool, timePrefix: String) -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = isBest ? .secondary_purple : .basic_light_blue
        backgroundView.layer.cornerRadius = 30
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let timeLabel = UILabel.createLabel(text: "\(timePrefix) \(time)", fontSize: 18, textAlignment: .left)
        backgroundView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            timeLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
            timeLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            
            backgroundView.heightAnchor.constraint(equalToConstant: 69)
        ])
        
        return backgroundView
    }
    
    private func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
