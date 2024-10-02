//
//  SelectedGameController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class SelectedGameController: UIViewController {
    let selectGameStackView = UIStackView()
    var selectGameView: UIView = {
        let view = UIView()
        view.configureView(color: .white, applyShadow: true)
        return view
    }()
    var selectGameLabel = UILabel.createLabel(text: "Select Game", fontSize: 24, isBold:true)
    var singlePlayerButton = UIButton.makeCustomButtonWithImage(image: UIImage(named: "single_player"), label:"Single Player", target: SelectedGameController.self, action: #selector(goToNextScreen))
    var twoPlayersButton = UIButton.makeCustomButtonWithImage(image: UIImage(named: "two_players"), label: "Two Players", target: SelectedGameController.self, action: #selector(goToNextScreen))
    var leaderbordButton = UIButton.makeCustomButtonWithImage(image: UIImage(named: "rocket"), label: "Leaderboard", target: SelectedGameController.self, action: #selector(goToNextScreen))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .basic_background
        
        view.addSubview(selectGameView)
        
        
        selectGameStackView.addArrangedSubview(selectGameLabel)
        selectGameStackView.addArrangedSubview(singlePlayerButton)
        selectGameStackView.addArrangedSubview(twoPlayersButton)
        selectGameStackView.addArrangedSubview(leaderbordButton)
        selectGameStackView.axis = .vertical
        selectGameStackView.spacing = 20
        selectGameStackView.translatesAutoresizingMaskIntoConstraints = false
        
        makeConstraints()
        
    }
    
    func makeConstraints() {
        selectGameView.addSubview(selectGameStackView)
        
        NSLayoutConstraint.activate([
            selectGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            selectGameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            selectGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            
            selectGameStackView.leadingAnchor.constraint(equalTo: selectGameView.leadingAnchor, constant: 20),
            selectGameStackView.topAnchor.constraint(equalTo: selectGameView.topAnchor, constant: 20),
            selectGameStackView.trailingAnchor.constraint(equalTo: selectGameView.trailingAnchor, constant: -20),
            selectGameStackView.bottomAnchor.constraint(equalTo: selectGameView.bottomAnchor, constant: -20),
            
            singlePlayerButton.heightAnchor.constraint(equalToConstant: 69),
            twoPlayersButton.heightAnchor.constraint(equalToConstant: 69),
            leaderbordButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
    
    //    func setViews() {
    //            view.addSubview(selectGameStackView)
    //            view.addSubview(selectGameView)
    //            view.addSubview(selectGameLabel)
    //            view.addSubview(singlePlayerButton)
    //            view.addSubview(twoPlayersButton)
    //        }
    @objc func goToNextScreen() {
        let vc = NextVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

