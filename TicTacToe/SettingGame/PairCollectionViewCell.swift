//
//  PairCollectionViewCell.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 02.10.2024.
//

import UIKit

class PairCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageViewX : UIImageView = {
        let element = UIImageView()
        element.image = Images.x_pair1
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var imageViewO : UIImageView = {
        let element = UIImageView()
        element.image = Images.o_pair1
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCustomView() {
        self.addSubview(imageViewX)
        self.addSubview(imageViewO)
    }
    
}
