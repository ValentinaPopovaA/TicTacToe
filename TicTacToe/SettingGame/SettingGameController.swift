//
//  SettingGameController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit


class SettingGameController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var gameSetting : Setting = Setting(gameMode: gameMode.singlePlayer, gameTime: true, duration: 60, music: false, selectedMusic: "", player1Image: "x_pair1", palyer2Image: "o_pair1", selectedPairNumber: 2)
    
    // Заголовок строка
//    private lazy var headerStackView : UIStackView = {
//        let element = UIStackView()
//        element.translatesAutoresizingMaskIntoConstraints = false
//        return element
//    }()
    // Стрелка
//    lazy var backButton = UIButton.makeCustomButtonWithLabel(label: "⬅︎", buttonColor: .clear, textColor: .black, fontSize: 40, borderColor: .clear, target: self, action: #selector(goToNextScreen))
//    
//    @objc func goToNextScreen() {
//        let vc = NextVC()
//        navigationController?.pushViewController(vc, animated: true)
//    }
    // Заголовок текст
//    private lazy var headerLabel = UILabel.createLabel(text: "Setting", fontSize: 20, isBold: true)

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
        switchElement.onTintColor = .basic_blue
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
        switchElement.onTintColor = .basic_blue
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
       
        element.dropView.dropDownOptions = ["30 min", "60 min", "120 min"]
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var mainStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 30
        element.distribution = .fill
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var firstView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()
    lazy var secondView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()

    private lazy var settingStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 20
      
        firstView.addSubview(switchGameTime)
        secondView.addSubview(switchMusic)
        element.addArrangedSubview(firstView)
        element.addArrangedSubview(dropDownDuration)
        element.addArrangedSubview(secondView)
        element.addArrangedSubview(dropDownMusic)
       
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var collectionview: UICollectionView!
    var cellId = "Cell"

    override func viewDidLoad() {
//        title = "Setting"
        setupUI()
        setupLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! PairCollectionViewCell
        
        let currentCellIndex = indexPath[1]+1
        
        if gameSetting.selectedPairNumber != currentCellIndex {
            cell.button.backgroundColor = .basic_light_blue
            cell.button.setTitleColor(UIColor.basic_black, for: .normal)
            cell.button.setTitle("Choose", for: .normal)
        }
        cell.imageX.image = UIImage(named: "x_pair\(indexPath[1]+1)")
        cell.imageO.image = UIImage(named: "o_pair\(indexPath[1]+1)")
        
        return cell
    }
}

private extension SettingGameController {
    func setupUI(){
        view.backgroundColor = .basic_background
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 152, height: 150)
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(PairCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.basic_background

        container.addSubview(settingStackView)
        mainStackView.addArrangedSubview(container)
        mainStackView.addArrangedSubview(collectionview)
        
        view.addSubview(mainStackView)
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
           
            settingStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            settingStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            settingStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            switchGameTime.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            switchGameTime.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            switchGameTime.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            switchGameTime.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
                     
            
            switchMusic.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 20),
            switchMusic.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -20),
            switchMusic.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            switchMusic.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
         
            dropDownMusic.heightAnchor.constraint(equalToConstant: 69),
       
            dropDownDuration.heightAnchor.constraint(equalToConstant: 69),
            
            collectionview.widthAnchor.constraint(equalToConstant: 300),
            collectionview.heightAnchor.constraint(equalToConstant: 300),
            
            firstView.widthAnchor.constraint(equalToConstant: 268),
            firstView.heightAnchor.constraint(equalToConstant: 69),            
            
            secondView.heightAnchor.constraint(equalToConstant: 69),
            secondView.widthAnchor.constraint(equalToConstant: 268),
            
        ])
        
    }
}


