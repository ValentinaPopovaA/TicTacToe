//
//  UIView_Extension.swift
//  TicTacToe
//
//  Created by Валентина Попова on 30.09.2024.
//

import UIKit

extension UIView {
    enum Color {
        case white
        case basic_light_blue
    }
    
    func configureView(color: Color, applyShadow: Bool) {
        self.layer.cornerRadius = 30
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch color {
        case .white:
            self.backgroundColor = .basic_white
        case .basic_light_blue:
            self.backgroundColor = .basic_light_blue
        }
        
        if applyShadow {
            self.layer.shadowColor = UIColor.basic_black?.cgColor
            self.layer.shadowOpacity = 0.1
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
            self.layer.shadowRadius = 10
            self.layer.masksToBounds = false
        } else {
            self.layer.shadowOpacity = 0
        }
    }
    
    func configureCircularView(size: CGFloat = 45) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: size).isActive = true
        self.heightAnchor.constraint(equalToConstant: size).isActive = true
        self.layer.cornerRadius = size / 2
        self.backgroundColor = .secondary_purple
    }

}
