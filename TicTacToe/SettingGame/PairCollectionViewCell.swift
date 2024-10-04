//
//  PairCollectionViewCell.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 02.10.2024.
//

import UIKit
import Foundation

class PairCollectionViewCell: UICollectionViewCell {
    
    weak var delegate : SettingGameController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
    }
    
     var imageX : UIImageView = {
        let element = UIImageView()
        element.sizeToFit()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
     var imageO : UIImageView = {
        let element = UIImageView()
        element.sizeToFit()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var button : UIButton = {
        let element = UIButton()
        
        element.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        element.backgroundColor = .basic_light_blue
        element.setTitleColor(UIColor.basic_black, for: .normal)
        
        element.layer.cornerRadius = 20
        element.setTitle("Choose", for: .normal)
        element.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
                
        let imageName = (imageX.image!.imageAsset!.value(forKey: "assetName")! as? String ?? "")
        var toIndex = (imageName.last! as? Int ?? 1)
        //print(imageName.last!)
        self.delegate?.pairChoosed(index: toIndex)
        //print(sender.titleLabel?.text ?? "Cyjgrf")
    }
    
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
        let element = UIView()
        element.configureView(color: .white, applyShadow: true)
        element.addSubview(column)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()


    func addViews(){
                
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            imageO.heightAnchor.constraint(equalToConstant: 54),
            imageO.widthAnchor.constraint(equalToConstant: 54),

            imageX.heightAnchor.constraint(equalToConstant: 54),
            imageX.widthAnchor.constraint(equalToConstant: 54),
            
            column.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            column.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            column.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            column.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            button.heightAnchor.constraint(equalToConstant: 39),
            button.widthAnchor.constraint(equalToConstant: 112),
            
            containerView.heightAnchor.constraint(equalToConstant: 150),
            containerView.widthAnchor.constraint(equalToConstant: 152),
        ])
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
