//
//  SettingGameController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit


class SettingGameController: UIViewController {
    
    private lazy var headerStackView : UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var backButton = UIButton.makeCustomButtonWithImage(image: Images.o_pair1!, label: "", target: self, action: #selector(goToNextScreen))
    
    
    
    @objc func goToNextScreen() {
        let vc = NextVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private lazy var headerLabel = UILabel.createLabel(text: "Setting", fontSize: 20)

    private lazy var container: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 348, height: 287)
        view.backgroundColor = .basic_white
        view.layer.cornerRadius = 30
        var shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 30)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor.basic_black!.cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 30
        layer0.shadowOffset = CGSize(width: 4, height: 4)
        return view
    }()
    
    private lazy var switchGameTime : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillProportionally
        element.backgroundColor = .basic_light_blue
        element.layer.cornerRadius = 30
        
        var label = UILabel()
        label.text = "Game Time"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        element.addArrangedSubview(label)
        element.addArrangedSubview(UISwitch())
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()   
    
    private lazy var switchMusic : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillProportionally
        element.backgroundColor = .basic_light_blue
        element.layer.cornerRadius = 30
        
        var label = UILabel()
        label.text = "Music"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        element.addArrangedSubview(label)
        element.addArrangedSubview(UISwitch())
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
   
    private lazy var selectMusic : UIPickerView = {
        let element = UIPickerView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var mainStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 30
        element.distribution = .fill
//        element.alignment = .top
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
  
//    private lazy var headerStackView : UIStackView = {
//        let element = UIStackView()
//        element.axis = .horizontal
//        
//        element.translatesAutoresizingMaskIntoConstraints = false
//        return element
//    }()
    
    private lazy var settingStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 30
        element.backgroundColor = .green
        element.addArrangedSubview(switchGameTime)
        element.addArrangedSubview(switchMusic)
        element.addArrangedSubview(selectMusic)
       
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    
    private lazy var titleLabel : UILabel = {
        let element = UILabel()
        element.frame = CGRect(x: 0, y: 0, width: 185, height: 29)
        element.textColor = .basic_black
        element.font = .systemFont(ofSize: 24, weight: .bold)
        element.textAlignment = .center
        element.text = "Settings"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()



    override func viewDidLoad() {
        navigationItem.backButtonTitle = "Setting"
        setupUI()
        setupLayout()
    }
}

private extension SettingGameController {
    func setupUI(){
        
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(headerLabel)
        
        view.backgroundColor = .basic_background
        mainStackView.addArrangedSubview(headerStackView)
        container.addSubview(settingStackView)
        mainStackView.addArrangedSubview(container)
        
        view.addSubview(mainStackView)
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            
            settingStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            settingStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            settingStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            switchGameTime.leadingAnchor.constraint(equalTo: settingStackView.leadingAnchor, constant: 20),
            switchGameTime.trailingAnchor.constraint(equalTo: settingStackView.trailingAnchor, constant: -20),
            switchGameTime.heightAnchor.constraint(equalToConstant: 69),
           // switchGameTime.widthAnchor.constraint(equalToConstant: 268),
            
            
            switchMusic.leadingAnchor.constraint(equalTo: settingStackView.leadingAnchor, constant: 20),
            switchMusic.trailingAnchor.constraint(equalTo: settingStackView.trailingAnchor, constant: -20),
            switchMusic.heightAnchor.constraint(equalToConstant: 69),
            //switchMusic.widthAnchor.constraint(equalToConstant: 268),
            
        ])
        
    }
}
