//
//  LeaderboardController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 02.10.2024.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    let messageLabel = UILabel.createLabel(text: "No game history\nwith turn on time", fontSize: 20)
    let imageView = UIImageView.makeSimpleImage(image: Images.robot)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .basic_background
        setViews()
        makeConstraints()
    }
}

private extension LeaderboardViewController {
    func setViews() {
        view.addSubview(messageLabel)
        view.addSubview(imageView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            messageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
            
