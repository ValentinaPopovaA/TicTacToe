//
//  SettingGameController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit


class SettingGameController: UIViewController {
    
    
    // Заголовок строка
    private lazy var headerStackView : UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    // Стрелка
    lazy var backButton = UIButton.makeCustomButtonWithLabel(label: "⬅︎", buttonColor: .clear, textColor: .black, fontSize: 40, borderColor: .clear, target: self, action: #selector(goToNextScreen))
    
    @objc func goToNextScreen() {
        let vc = NextVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    // Заголовок текст
    private lazy var headerLabel = UILabel.createLabel(text: "Setting", fontSize: 20)

    // Контейнер
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
    
    // Настройка 1
    private lazy var switchGameTime : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        //element.spacing = 10
        element.distribution = .equalSpacing
        element.backgroundColor = .basic_light_blue
        
        var label = UILabel()
        label.text = "Game Time"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        element.addArrangedSubview(label)
        
        var switchElement = UISwitch()
        element.addArrangedSubview(switchElement)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    // Настройка музыка
    private lazy var switchMusic : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        //element.spacing = 10
        element.distribution = .equalSpacing
        element.backgroundColor = .basic_light_blue
        
        var label = UILabel()
        label.text = "Music"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        element.addArrangedSubview(label)
        
        var switchElement = UISwitch()
        element.addArrangedSubview(switchElement)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // Выбор музыки
    private lazy var dropDownMusic : DropDownButton = {
        let element = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        element.setLabel(string:  "Select Music")
        element.layer.cornerRadius = 30
        //Set the drop down menu's options
        element.dropView.dropDownOptions = ["Classical", "Instrumental", "Nature"]
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    // Duration
    private lazy var dropDownDuration : DropDownButton = {
        let element = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
       // element.setTitle("Duration", for: .normal)
        element.setLabel(string: "Duration")
        element.layer.cornerRadius = 30
        //Set the drop down menu's options
        element.dropView.dropDownOptions = ["30 min", "60 min", "120 min"]
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

    private lazy var settingStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 30
        element.backgroundColor = .green
        
        element.addArrangedSubview(switchGameTime)
        element.addArrangedSubview(dropDownDuration)
        element.addArrangedSubview(switchMusic)
        element.addArrangedSubview(dropDownMusic)
        
        
        //element.addArrangedSubview(selectMusic)
       
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    override func viewDidLoad() {
   
        setupUI()
        setupLayout()
    }
}

private extension SettingGameController {
    func setupUI(){
        view.backgroundColor = .basic_background
        
        ////
        headerStackView.backgroundColor = .red
        mainStackView.backgroundColor = .blue
        ////
        
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(headerLabel)
        
        mainStackView.addArrangedSubview(headerStackView)
        container.addSubview(settingStackView)
        mainStackView.addArrangedSubview(container)
        
        view.addSubview(mainStackView)
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            settingStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            settingStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            settingStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            switchGameTime.leadingAnchor.constraint(equalTo: settingStackView.leadingAnchor, constant: 0),
            switchGameTime.trailingAnchor.constraint(equalTo: settingStackView.trailingAnchor, constant: 0),
            //switchGameTime.heightAnchor.constraint(equalToConstant: 69),
           // switchGameTime.widthAnchor.constraint(equalToConstant: 268),
            
            
            switchMusic.leadingAnchor.constraint(equalTo: settingStackView.leadingAnchor, constant: 0),
            switchMusic.trailingAnchor.constraint(equalTo: settingStackView.trailingAnchor, constant: 0),
            //switchMusic.heightAnchor.constraint(equalToConstant: 69),
            //switchMusic.widthAnchor.constraint(equalToConstant: 268),
            
            //button Constraints
            //dropDownMusic.centerXAnchor.constraint(equalTo: settingStackView.centerXAnchor),
            //dropDownMusic.centerYAnchor.constraint(equalTo: settingStackView.centerYAnchor),
            dropDownMusic.widthAnchor.constraint(equalToConstant: 300),
            dropDownMusic.heightAnchor.constraint(equalToConstant: 69),
            
            dropDownDuration.widthAnchor.constraint(equalToConstant: 300),
            dropDownDuration.heightAnchor.constraint(equalToConstant: 69),
            
            
        ])
        
    }
}


