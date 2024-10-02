//
//  UILabel_Extension.swift
//  TicTacToe
//
//  Created by Валентина Попова on 30.09.2024.
//

import UIKit

extension UILabel {
    static func createLabel(text: String,
                            fontSize: CGFloat,
                            isBold: Bool = false,
                            textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
