//
//  SettingGameController.swift
//  TicTacToe
//
//  Created by Валентина Попова on 29.09.2024.
//

import UIKit


class SettingGameController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var gameSetting = GameSettings.shared.getSettingsLoad()
    
    private var dropDownMusicViewHeightConstraint: NSLayoutConstraint?
    private var dropDownGameTimeViewHeightConstraint: NSLayoutConstraint?
    
    private var isHiddenMusicSelect = true
    private var isHiddenGameTimeSelect = true
    
    private var isMusic = false
    private var isGameTime = false
    
    private var heightDuration = CGFloat(69)
    private var heightSelectMusic = CGFloat(69)

    
//    let scrollView: UIScrollView = {
//            let scrollView = UIScrollView()
//
//            scrollView.translatesAutoresizingMaskIntoConstraints = false
//            return scrollView
//        }()
    
    // Контейнер с тенью
    private lazy var container: UIView = {
        let view = UIView()
        //view.frame = CGRect(x: 0, y: 0, width: 348, height: 287)
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
    
    // Настройка Время игры
    private lazy var switchGameTime : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal        
        element.distribution = .equalSpacing
        element.backgroundColor = .basic_light_blue
                
        var label = UILabel()
        label.text = "Game Time"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        element.addArrangedSubview(label)
        
        var switchElement = UISwitch()
        switchElement.onTintColor = .basic_blue
        switchElement.isOn = self.gameSetting.gameTime
        switchElement.addTarget(self, action: #selector(switchGameTimeDidChange), for: .valueChanged)
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
        switchElement.isOn = self.gameSetting.musicEnable
        switchElement.addTarget(self, action: #selector(switchMusicDidChange), for: .valueChanged)
        element.addArrangedSubview(switchElement)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // Выбор музыки
    private lazy var dropDownMusic : DropDownButton = {
        let element = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        element.setLabel(string:  "Select Music")
        element.setValue(string: gameSetting.selectedMusic)
        element.layer.cornerRadius = 30
        element.delegate = self
        element.dropView.dropDownOptions = ["donkey", "neighbour", "country"]
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var dropDownMusicView : UIView = {
        let element = UIView()
        element.addSubview(dropDownMusic)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    // Duration
    private lazy var dropDownDuration : DropDownButton = {
        let element = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        element.setLabel(string: "Duration")

        var sec = ""
        switch gameSetting.duration
        {
            case 60 : sec = "60 sec"
            case 30 : sec = "30 sec"
            default: sec = "10 sec"
        }
        element.setValue(string: sec)
        element.layer.cornerRadius = 30
        element.delegate = self
        element.dropView.dropDownOptions = ["10 sec", "30 sec", "60 sec"]
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var dropDownDurationView : UIView = {
        let element = UIView()
        element.addSubview(dropDownDuration)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var gameTimeView: UIView = {
        let element = UIView()
        element.configureView(color: .basic_light_blue, applyShadow: true)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var musicView: UIView = {
        let view = UIView()
        view.configureView(color: .basic_light_blue, applyShadow: true)
        return view
    }()

    private lazy var settingStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 20
        element.alignment = .fill
        gameTimeView.addSubview(switchGameTime)
        musicView.addSubview(switchMusic)
        
        element.addArrangedSubview(gameTimeView)
        element.addArrangedSubview(dropDownDurationView)
        element.addArrangedSubview(musicView)
        element.addArrangedSubview(dropDownMusicView)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var collectionview: UICollectionView!
    var cellId = "Cell"

    override func viewDidLoad() {
        title = "Setting"
        
        setupUI()
        setupLayout()
  
        isMusic = self.gameSetting.musicEnable
        isGameTime = self.gameSetting.gameTime
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0.0,
            options: [.curveEaseOut],
            animations: {
                self.dropDownDurationView.isHidden = !self.gameSetting.gameTime
                self.dropDownDurationView.alpha = (self.gameSetting.gameTime ? 1.0 : 0.0)
                self.dropDownMusicView.isHidden = !self.gameSetting.musicEnable
                self.dropDownMusicView.alpha = (self.gameSetting.musicEnable ? 1.0 : 0.0)
        })
    }
    
    
    @objc func switchGameTimeDidChange(_ sender: UISwitch!)
    {
        // MARK:  Save setting Game Time
        gameSetting = GameSettings.shared.getSettingsLoad() // load last
        gameSetting = Setting(gameTime: sender.isOn,
                              duration: gameSetting.duration,
                              musicEnable: gameSetting.musicEnable,
                              selectedMusic: gameSetting.selectedMusic,
                              player1Image: gameSetting.player1Image,
                              player2Image: gameSetting.player2Image,
                              selectedPairNumber: gameSetting.selectedPairNumber)
        
        GameSettings.shared.saveSettings(gameSetting)
        
        if sender.isOn {
            UIView.animate(
                withDuration: 0.2,
                delay: 0.0,
                options: [.curveEaseOut],
                animations: {
                    self.dropDownDurationView.isHidden = false
                    self.dropDownDurationView.alpha = 1.0
            })
        }
        else{
            UIView.animate(
                withDuration: 0.2,
                delay: 0.0,
                options: [.curveEaseOut],
                animations: {
                    self.dropDownDurationView.isHidden = true
                    self.dropDownDurationView.alpha = 0.0
            })
        }
    }
    @objc func switchMusicDidChange(_ sender: UISwitch!)
    {
        
        // MARK:  Save setting Game Time
        gameSetting = GameSettings.shared.getSettingsLoad() // load last
        
        gameSetting = Setting(gameTime: gameSetting.gameTime,
                              duration: gameSetting.duration,
                              musicEnable: sender.isOn,
                              selectedMusic: gameSetting.selectedMusic,
                              player1Image: gameSetting.player1Image,
                              player2Image: gameSetting.player2Image,
                              selectedPairNumber: gameSetting.selectedPairNumber)
        
        GameSettings.shared.saveSettings(gameSetting)

        if sender.isOn {
            UIView.animate(
                withDuration: 0.2,
                delay: 0.0,
                options: [.curveEaseOut],
                animations: {
                    self.dropDownMusicView.isHidden = false
                    self.dropDownMusicView.alpha = 1.0
            })
        }
        else{
            UIView.animate(
                withDuration: 0.2,
                delay: 0.0,
                options: [.curveEaseOut],
                animations: {
                    self.dropDownMusicView.isHidden = true
                    self.dropDownMusicView.alpha = 0.0
            })
        }
    }
    
    
    
    func pairChoosed(index:Int)
    {
        // MARK:  Save setting Choose pair Cross Circle
        gameSetting = GameSettings.shared.getSettingsLoad() // load last
        gameSetting = Setting(gameTime: gameSetting.gameTime,
                              duration: gameSetting.duration,
                              musicEnable: gameSetting.musicEnable ,
                              selectedMusic: gameSetting.selectedMusic,
                              player1Image: "x_pair\(index)",
                              player2Image: "o_pair\(index)",
                              selectedPairNumber: index)
        
        GameSettings.shared.saveSettings(gameSetting)
        
        for i in 0...5 {
            if let cell = self.collectionview.cellForItem(at: NSIndexPath(row: i, section: 0) as IndexPath) as? PairCollectionViewCell {
                if (i+1) == index {
                   cell.button.backgroundColor = UIColor.basic_blue
                   cell.button.setTitleColor(UIColor.basic_white, for: .normal)
                   cell.button.setTitle("Picked", for: .normal)
                } else {
                    cell.button.backgroundColor = .basic_light_blue
                    cell.button.setTitleColor(UIColor.basic_black, for: .normal)
                    cell.button.setTitle("Choose", for: .normal)
                }
                   
            }
        }
    }
    
    func showMusicSelect() {
        dropDownMusicViewHeightConstraint?.constant = isHiddenMusicSelect ? 219 : heightSelectMusic
        isHiddenMusicSelect = !isHiddenMusicSelect
     
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func showDurationSelect() {
        dropDownGameTimeViewHeightConstraint?.constant = isHiddenGameTimeSelect ? 219 : heightDuration
        isHiddenGameTimeSelect = !isHiddenGameTimeSelect
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! PairCollectionViewCell
        
        let currentCellIndex = indexPath[1]+1
        
        if gameSetting.selectedPairNumber == currentCellIndex {
            
            cell.button.backgroundColor = UIColor.basic_blue
            cell.button.setTitleColor(UIColor.basic_white, for: .normal)
            cell.button.setTitle("Picked", for: .normal)
        }
        cell.imageX.image = UIImage(named: "x_pair\(indexPath[1]+1)")
        cell.imageO.image = UIImage(named: "o_pair\(indexPath[1]+1)")
        cell.delegate = self
        
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
        //collectionview.isPrefetchingEnabled = false
        collectionview.register(PairCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.basic_background
        collectionview.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(settingStackView)
        mainStackView.addArrangedSubview(container)
        mainStackView.addArrangedSubview(collectionview)
        
        view.addSubview(mainStackView)
    }
    
    
    
    func setupLayout(){
        
        dropDownMusic.heightAnchor.constraint(equalToConstant: 69).isActive = true
        dropDownMusicViewHeightConstraint = dropDownMusicView.heightAnchor.constraint(equalToConstant: 69)
        dropDownMusicViewHeightConstraint?.isActive = true
        
        dropDownDuration.heightAnchor.constraint(equalToConstant: heightDuration).isActive = true
        dropDownGameTimeViewHeightConstraint = dropDownDurationView.heightAnchor.constraint(equalToConstant: heightDuration)
        dropDownGameTimeViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
           
            settingStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            settingStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            settingStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            switchGameTime.leadingAnchor.constraint(equalTo: gameTimeView.leadingAnchor, constant: 20),
            switchGameTime.trailingAnchor.constraint(equalTo: gameTimeView.trailingAnchor, constant: -20),
            switchGameTime.centerXAnchor.constraint(equalTo: gameTimeView.centerXAnchor),
            switchGameTime.centerYAnchor.constraint(equalTo: gameTimeView.centerYAnchor),
            
            gameTimeView.widthAnchor.constraint(equalToConstant: 268),
            gameTimeView.heightAnchor.constraint(equalToConstant: 69),       
            
            //dropDownDuration.heightAnchor.constraint(equalToConstant: 69),
            //dropDownDuration.topAnchor.constraint(equalTo: gameTimeView.bottomAnchor, constant: 20),
            dropDownDuration.trailingAnchor.constraint(equalTo: dropDownDurationView.trailingAnchor, constant: 0),
            dropDownDuration.leadingAnchor.constraint(equalTo: dropDownDurationView.leadingAnchor, constant: 0),
            
            switchMusic.leadingAnchor.constraint(equalTo: musicView.leadingAnchor, constant: 20),
            switchMusic.trailingAnchor.constraint(equalTo: musicView.trailingAnchor, constant: -20),
            switchMusic.centerXAnchor.constraint(equalTo: musicView.centerXAnchor),
            switchMusic.centerYAnchor.constraint(equalTo: musicView.centerYAnchor),
         
            musicView.heightAnchor.constraint(equalToConstant: 69),
            musicView.widthAnchor.constraint(equalToConstant: 268),
            
            dropDownMusic.trailingAnchor.constraint(equalTo: dropDownMusicView.trailingAnchor, constant: 0),
            dropDownMusic.leadingAnchor.constraint(equalTo: dropDownMusicView.leadingAnchor, constant: 0),
            
            collectionview.topAnchor.constraint(equalTo: settingStackView.bottomAnchor, constant: 20),
            
            
        ])
        
    }
}


