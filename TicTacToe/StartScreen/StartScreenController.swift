//
//  StartScreenController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit

class StartViewController: UIViewController {
    
//UI
    private lazy var settingsButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .clear
        element.setImage( UIImage(named: "setting_icon"), for: .normal)
        //element.setImage(Images.settingsButton, for: .normal)
        element.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var rulesButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .clear
        element.setImage( UIImage(named: "instruction"), for: .normal)
        //element.setImage(Images.rulesButton, for: .normal)
        element.addTarget(self, action: #selector(showRules), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var label = UILabel.createLabel(text: "TIC-TAC-TOE", fontSize: 20, isBold: true)
    lazy var imageView = UIImageView.makeSimpleImage(image: Images.logo) // прописал через точку
    lazy var playStartButton = UIButton.makeCustomButtonWithLabel(label: "Let`s play", buttonColor: .basic_blue, textColor: .white, fontSize: 20, borderColor: .basic_blue, target: self, action: #selector(showSelectGameScreen))
    
    
// Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setViews()
        makeConstraints()
       //navigationController?.isNavigationBarHidden = true //?
       navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: settingsButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear (animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear (animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
// Methods
    
    @objc func showSelectGameScreen() {
        let selectGameVC = SelectedGameController()
        navigationController?.pushViewController(selectGameVC, animated: true)
    }
    
    @objc func showSettings(){
        let settingsVC = SettingGameController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc func showRules(){
        let rulesVC = HowToPlayController()
        navigationController?.pushViewController(rulesVC, animated: true)
    }
}

// Extension

private extension StartViewController {
    func setViews() {
        view.addSubview(playStartButton)
        view.addSubview(label)
        view.addSubview(imageView)
        view.addSubview(settingsButton)
        view.addSubview(rulesButton)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -115),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7), // 0.5
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor),
                  
            playStartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            playStartButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            playStartButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            playStartButton.heightAnchor.constraint(equalToConstant: 80),
            
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            rulesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            rulesButton.heightAnchor.constraint(equalToConstant: 36),
            rulesButton.widthAnchor.constraint(equalToConstant: 36),
            
            settingsButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            settingsButton.heightAnchor.constraint(equalToConstant: 36),
            settingsButton.widthAnchor.constraint(equalToConstant: 36),
        ])
    }
}
