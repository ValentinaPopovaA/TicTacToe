//
//  UIImageView_Extension.swift
//  TicTacToe
//
//  Created by Валентина Попова on 30.09.2024.
//

import UIKit

extension UIImageView {
    static func makeSimpleImage(imageName: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
