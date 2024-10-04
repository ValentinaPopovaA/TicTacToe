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
        
        self.setTitle("", for: .normal)
        titleText.text = string
        self.dismissDropDown()
    }
    
    private var labelValue: String = ""
    private var value: String = ""
    
    func setLabel(string: String)
    {
        labelValue = string
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
        let label2 = UILabel()
        label.text = labelValue
        label.font = .systemFont(ofSize: 20, weight: .bold)
        element.addArrangedSubview(label)
        element.addArrangedSubview(titleText)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleText : UILabel = {
        let element = UILabel()
        element.text = ""
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
    }
    
    
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(rowStackView)
        self.superview?.addSubview(dropView)
        //self.superview?.bringSubviewToFront(dropView)

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
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.showMusicSelect()
        delegate?.showSelect(vewHeightConstraint: delegate?.dropDownGameTimeViewHeightConstraint)
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

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func dismissDropDown() {
        delegate?.showMusicSelect()
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
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
        
        //tableView.backgroundColor = UIColor.basic_light_blue
        //self.backgroundColor = UIColor.green
        self.layer.cornerRadius = 30
  
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView.layer.cornerRadius = 30
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

