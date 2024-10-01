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
        case basic_blue
        case basic_light_blue
        
        var color: UIColor {
            switch self {
            case .clear:
                return .clear
            case .basic_blue:
                return UIColor.basic_blue ?? UIColor.systemBlue
            case .basic_light_blue:
                return UIColor.basic_light_blue ?? UIColor.systemTeal
            }
        }
    }
    
    enum TextColor {
        case white
        case black
        case basic_blue
        
        var color: UIColor {
            switch self {
            case .white:
                return UIColor.basic_white ?? UIColor.white
            case .black:
                return UIColor.basic_black ?? UIColor.black
            case .basic_blue:
                return UIColor.basic_blue ?? UIColor.systemBlue
            }
        }
    }
    
    enum BorderColor {
        case basic_blue
        case clear
        
        var color: UIColor {
            switch self {
            case .basic_blue:
                return UIColor.basic_blue ?? UIColor.systemBlue
            case .clear:
                return UIColor.clear
            }
        }
    }
    
    // Кнопка с текстом
    static func makeCustomButtonWithLabel(label: String,
                                          buttonColor: ButtonColor,
                                          textColor: TextColor,
                                          fontSize: CGFloat,
                                          borderColor: BorderColor,
                                          target: Any?,
                                          action: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = buttonColor.color
        button.setTitle(label, for: .normal)
        button.setTitleColor(textColor.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.layer.cornerRadius = 30
        button.layer.borderColor = borderColor.color.cgColor
        button.layer.borderWidth = 2
        button.addTarget(target, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // Кнопка с картинкой
    static func makeCustomButtonWithImage(image: UIImage,
                                          label: String,
                                          target: Any?,
                                          action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor.basic_light_blue
        button.setTitle(label, for: .normal)
        button.setTitleColor(UIColor.basic_black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 30
        button.addTarget(target, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
}
