//
//  UIButton_Extension.swift
//  TicTacToe
//
//  Created by Валентина Попова on 30.09.2024.
//
import UIKit

extension UIButton {
    enum ButtonColor {
        case clear
        case basicBlue
    }
    
    enum TextColor {
        case white
        case basicBlue
    }
    
    convenience init(label: String, buttonColor: ButtonColor, textColor: TextColor, target: Any?, action: Selector) {
        self.init()
        self.layer.cornerRadius = 30
        self.setTitle(label, for: .normal)
        
        let basicBlueColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1) //заменить после добавления цветов
        
        switch textColor {
        case .white:
            self.setTitleColor(.white, for: .normal)
        case .basicBlue:
            self.setTitleColor(basicBlueColor, for: .normal)
        }
        
        switch buttonColor {
        case .clear:
            self.backgroundColor = .clear
        case .basicBlue:
            self.backgroundColor = basicBlueColor
        }
        
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.layer.borderColor = basicBlueColor.cgColor
        self.layer.borderWidth = 2
        self.addTarget(target, action: action, for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
