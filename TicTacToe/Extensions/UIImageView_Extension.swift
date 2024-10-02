//
//  UIImageView_Extension.swift
//  TicTacToe
//
//  Created by Валентина Попова on 30.09.2024.
//

import UIKit

extension UIImageView {
    static func makeSimpleImage(image: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
