//
//  ResultView.swift
//  TicTacToe
//
//  Created by Валентина Попова on 02.10.2024.
//

import UIKit

//final class ResultView: UIView {
//
//    lazy var label = UILabel.createLabel(text: "", fontSize: 20, isBold: true)
//    lazy var imageView = UIImageView.makeSimpleImage(image: nil)
//    lazy var playAgainButton = UIButton.makeCustomButtonWithLabel(label: "Play again", buttonColor: .basic_blue, textColor: .white, fontSize: 20, borderColor: .basic_blue, target: nil, action: nil)
//    lazy var backButton = UIButton.makeCustomButtonWithLabel(label: "Back", buttonColor: .clear, textColor: .basic_blue, fontSize: 20, borderColor: .basic_blue, target: nil, action: nil)
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .basic_white
//        setViews()
//        makeConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setViews() {
//        addSubview(playAgainButton)
//        addSubview(backButton)
//        addSubview(label)
//        addSubview(imageView)
//    }
//
//    private func makeConstraints() {
//        NSLayoutConstraint.activate([
//            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 60),
//            label.centerXAnchor.constraint(equalTo: centerXAnchor),
//
//            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
//            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
//            imageView.heightAnchor.constraint(equalTo: widthAnchor),
//
//            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            backButton.heightAnchor.constraint(equalToConstant: 72),
//
//            playAgainButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20),
//            playAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            playAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            playAgainButton.heightAnchor.constraint(equalToConstant: 72),
//        ])
//    }
//}
