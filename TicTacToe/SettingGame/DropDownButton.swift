//
//  DropDownButton.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 02.10.2024.
//
import UIKit

protocol DropDownProtocol {
    func dropDownPressed(string : String)
}

class DropDownButton: UIButton, DropDownProtocol {
    
    weak var delegate: SettingGameController?
            
    func dropDownPressed(string: String) {
        var gameSetting = GameSettings.shared.getSettingsLoad()
        self.setTitle("", for: .normal)
        titleText.text = string
        self.dismissDropDown()
        
        if (labelValue == "Select Music"){
            
            gameSetting = Setting(gameTime: gameSetting.gameTime,
                                  duration: gameSetting.duration,
                                  musicEnable: gameSetting.musicEnable,
                                  selectedMusic: string,
                                  player1Image: gameSetting.player1Image,
                                  palyer2Image: gameSetting.player1Image,
                                  selectedPairNumber: gameSetting.selectedPairNumber)
        }
        if (labelValue == "Duration"){
            let duration = switch string { case "120 sec" : 120 case "60 sec": 60 default: 30 }
            
            gameSetting = Setting(gameTime: gameSetting.gameTime,
                                  duration: duration,
                                  musicEnable: gameSetting.musicEnable,
                                  selectedMusic: gameSetting.selectedMusic,
                                  player1Image: gameSetting.player1Image,
                                  palyer2Image: gameSetting.player1Image,
                                  selectedPairNumber: gameSetting.selectedPairNumber)
        }        
        
        GameSettings.shared.saveSettings(gameSetting)
    }
    
    private var labelValue: String = ""
    private var value: String = ""
    
    func setLabel(string: String)
    {
        labelValue = string
    }
    
    func setValue(string: String)
    {
        value = string
    }
    
    var dropView = DropDownView()
    
    var height = NSLayoutConstraint()
    
    private lazy var rowStackView : UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.alignment = .center
        element.distribution = .fill
        element.isUserInteractionEnabled = false
        
        let label = UILabel()
        label.text = labelValue
        label.font = .systemFont(ofSize: 20, weight: .bold)
        element.addArrangedSubview(label)
        element.addArrangedSubview(titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleText : UILabel = {
        let element = UILabel()
        element.text = value
        element.font = .systemFont(ofSize: 20)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.basic_light_blue
        
        dropView = DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
        
        self.superview?.addSubview(rowStackView)
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(rowStackView)
        self.superview?.bringSubviewToFront(dropView)

    }
        
    
    override func didMoveToSuperview() {
        
        self.superview?.addSubview(rowStackView)
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(rowStackView)
        self.superview?.bringSubviewToFront(dropView)
       
        if (self.subviews.isEmpty) {
                        
            
            NSLayoutConstraint.activate([
                rowStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                rowStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                rowStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                rowStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                dropView.topAnchor.constraint(equalTo: self.bottomAnchor),
                dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                dropView.widthAnchor.constraint(equalTo: self.widthAnchor),
                
            ])
            height = dropView.heightAnchor.constraint(equalToConstant: 0)
        }
        
    }
    
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (labelValue == "Select Music"){
            delegate?.showMusicSelect()
        }
        if (labelValue == "Duration"){
            delegate?.showDurationSelect()
        }
       
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]

            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func dismissDropDown() {
        
        if (labelValue == "Select Music"){
            delegate?.showMusicSelect()
        }
        if (labelValue == "Duration"){
            delegate?.showDurationSelect()
        }
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
    var dropDownOptions = [String]()
        
    var tableView = UITableView()
    
    var delegate : DropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.layer.cornerRadius = 30
  
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView.layer.cornerRadius = 30
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.basic_light_blue
        //cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

