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
                return .basic_blue ?? .systemBlue
            case .basic_light_blue:
                return .basic_light_blue ?? .systemTeal
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
                return .basic_white ?? .white
            case .black:
                return .basic_black ?? .black
            case .basic_blue:
                return .basic_blue ?? .systemBlue
            }
        }
    }
    
    enum BorderColor {
        case basic_blue
        case clear
        
        var color: UIColor {
            switch self {
            case .basic_blue:
                return .basic_blue ?? .systemBlue
            case .clear:
                return .clear
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.layer.cornerRadius = 30
        button.layer.borderColor = borderColor.color.cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(target, action: action, for: .touchUpInside)
        button.addTarget(button, action: #selector(buttonTouchedDown), for: .touchDown)
        
        return button
    }
    
    // Кнопка с картинкой
    static func makeCustomButtonWithImage(image: UIImage?,
                                          label: String,
                                          target: Any?,
                                          action: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .basic_light_blue
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 38).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = label
        titleLabel.textColor = .basic_black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        
        button.addTarget(target, action: action, for: .touchUpInside)
        button.addTarget(button, action: #selector(buttonTouchedDown), for: .touchDown)
        
        button.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        
        return button
    }
    
    @objc private func buttonTouchedDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
    }
}
