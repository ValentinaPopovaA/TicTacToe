//
//  PlayerBadgeView.swift
//  TicTacToe
//
//  Created by nik on 02.10.24.
//

import UIKit

final class PlayerBadgeView: UIView {
    
    private let playerImage: UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let playerName = UILabel.createLabel(text: "", fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage, name: String) {
        playerImage.image = image
        playerName.text = name
    }
}

private extension PlayerBadgeView {
    func setupViews() {
        self.backgroundColor = UIColor.basic_light_blue
        self.layer.cornerRadius = 30
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [
            playerImage,
            playerName
        ].forEach {
            addSubview($0)
        }
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            playerImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 54.0/103.0),
            playerImage.heightAnchor.constraint(equalTo: playerImage.widthAnchor),
            playerImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            playerImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            playerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            playerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            playerName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
