//
//  UIButton+.swift
//  TicTacToe
//
//  Created by Alexander Altman on 29.09.2024.
//

import UIKit

extension UIButton {
    convenience init(label: String, backgroundColor: UIColor, target: Any?, action: Selector) {
        self.init()
        self.layer.cornerRadius = 20
        self.setTitle(label, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = .boldSystemFont(ofSize: 24)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.addTarget(target, action: action, for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
