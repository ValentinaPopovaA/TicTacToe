//
//  PairCollectionViewCell.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 02.10.2024.
//

import UIKit

class PairCollectionViewCell: UICollectionViewCell {
    
    private var cellIndex: Int = 1
    
    func setIndex(i:Int){
        cellIndex = i
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
    }
    
    private lazy var imageX : UIImageView = {
        let element = UIImageView()
        element.sizeToFit()
        element.image = UIImage(named: "x_pair\(cellIndex)")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var imageO : UIImageView = {
        let element = UIImageView()
        element.sizeToFit()
        element.image = UIImage(named: "o_pair\(cellIndex)")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var button : UIButton = {
        let element = UIButton()
        element.setTitle("Picked", for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var row : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.addArrangedSubview(imageO)
        element.addArrangedSubview(imageX)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var column : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.addArrangedSubview(row)
        element.addArrangedSubview(button)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    

    


    func addViews(){
        backgroundColor = UIColor.white
        print(cellIndex)
        addSubview(column)
        
        imageO.heightAnchor.constraint(equalToConstant: 54).isActive = true
        imageO.widthAnchor.constraint(equalToConstant: 54).isActive = true

        imageX.heightAnchor.constraint(equalToConstant: 54).isActive = true
        imageX.widthAnchor.constraint(equalToConstant: 54).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
