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
        element.backgroundColor = UIColor.basic_blue
        
        element.setTitleColor(UIColor.basic_black, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        element.tintColor = UIColor.basic_white
        element.layer.cornerRadius = 20
        element.layer.borderColor = UIColor.basic_blue?.cgColor
        element.layer.borderWidth = 2
        element.setTitle("Picked", for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var row : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 4
        element.addArrangedSubview(imageX)
        element.addArrangedSubview(imageO)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var column : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 18
        element.addArrangedSubview(row)
        element.addArrangedSubview(button)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    

    lazy var containerView: UIView = {
        let view = UIView()
        view.configureView(color: .white, applyShadow: true)
        view.addSubview(column)
        return view
    }()


    func addViews(){
        //backgroundColor = UIColor.basic_background
        print(cellIndex)
        addSubview(containerView)
        
        imageO.heightAnchor.constraint(equalToConstant: 54).isActive = true
        imageO.widthAnchor.constraint(equalToConstant: 54).isActive = true

        imageX.heightAnchor.constraint(equalToConstant: 54).isActive = true
        imageX.widthAnchor.constraint(equalToConstant: 54).isActive = true
        
        column.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        column.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        column.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        column.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        
        button.heightAnchor.constraint(equalToConstant: 39).isActive = true
        button.widthAnchor.constraint(equalToConstant: 112).isActive = true
        
        containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 152).isActive = true
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
