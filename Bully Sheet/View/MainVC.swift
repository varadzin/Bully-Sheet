//
//  MainVC.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 04/12/2020.
//

import UIKit

class MainVC: UIViewController {
    
    var padding: CGFloat = 20
    
    var redBtn = UIButton()
    var orangeBtn = UIButton()
    var greenBtn = UIButton()
    var lightsExplainImg = UIImageView()
    var dayLabel = UILabel()
    
    var habitLabel1 = HabitLabel(text: " 1.habit")
    var habitLabel2 = HabitLabel(text: " 2.habit")
    var habitLabel3 = HabitLabel(text: " 3.habit")
    var habitLabel4 = HabitLabel(text: " 4.habit")
    var habitLabel5 = HabitLabel(text: " 5.habit")
    var habitTextField = UITextField()
    var userInput = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addBarButton()
        clearBarButton()
        configDayLabel()
        configHabitLbl4()
        configHabitLbl3()
        configHabitLbl2()
        configHabitLbl1()
        configHabitLbl5()
        configLightExplainImg()
        configOrangeBtn()
        configRedBtn()
        configGreenBtn()
        
    }
    
    
    
    func configDayLabel() {
        view.addSubview(dayLabel)
        
        dayLabel.text = "<<         today        >>"
        dayLabel.textColor = .label
        dayLabel.font = UIFont(name: "Arial", size: 25)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            dayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dayLabel.widthAnchor.constraint(equalToConstant: 250),
            dayLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func configHabitLbl1() {
        view.addSubview(habitLabel1)
        
        NSLayoutConstraint.activate([
            habitLabel1.bottomAnchor.constraint(equalTo: habitLabel2.topAnchor, constant: -padding),
            habitLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            habitLabel1.widthAnchor.constraint(equalToConstant: 240),
            habitLabel1.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configHabitLbl2() {
        view.addSubview(habitLabel2)
        
        NSLayoutConstraint.activate([
            habitLabel2.bottomAnchor.constraint(equalTo: habitLabel3.topAnchor, constant: -padding),
            habitLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            habitLabel2.widthAnchor.constraint(equalToConstant: 240),
            habitLabel2.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configHabitLbl3() {
        view.addSubview(habitLabel3)
        
        NSLayoutConstraint.activate([
            habitLabel3.bottomAnchor.constraint(equalTo: habitLabel4.topAnchor, constant: -padding),
            habitLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            habitLabel3.widthAnchor.constraint(equalToConstant: 240),
            habitLabel3.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configHabitLbl4() {
        view.addSubview(habitLabel4)
        
        NSLayoutConstraint.activate([
            habitLabel4.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            habitLabel4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            habitLabel4.widthAnchor.constraint(equalToConstant: 240),
            habitLabel4.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configHabitLbl5() {
        view.addSubview(habitLabel5)
        
        NSLayoutConstraint.activate([
            habitLabel5.topAnchor.constraint(equalTo: habitLabel4.bottomAnchor, constant: padding),
            habitLabel5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            habitLabel5.widthAnchor.constraint(equalToConstant: 240),
            habitLabel5.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configOrangeBtn() {
        view.addSubview(orangeBtn)
        let orangeBtnImg = UIImage(named: "orange-light")
        let orangeHiBtnImg = UIImage(named: "orange-light-hi")
        orangeBtn.setBackgroundImage(orangeBtnImg, for: .normal)
        orangeBtn.setBackgroundImage(orangeHiBtnImg, for: .highlighted)
        orangeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orangeBtn.topAnchor.constraint(equalTo: habitLabel3.topAnchor),
            orangeBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            orangeBtn.widthAnchor.constraint(equalToConstant: 60),
            orangeBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configRedBtn() {
        view.addSubview(redBtn)
        let redBtnImg = UIImage(named: "red-light")
        let redHiBtnImg = UIImage(named: "red-light-hi")
        redBtn.setBackgroundImage(redBtnImg, for: .normal)
        redBtn.setBackgroundImage(redHiBtnImg, for: .highlighted)
        redBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redBtn.topAnchor.constraint(equalTo: orangeBtn.bottomAnchor, constant: 35),
            redBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            redBtn.widthAnchor.constraint(equalToConstant: 60),
            redBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configGreenBtn() {
        view.addSubview(greenBtn)
        let greenBtnImg = UIImage(named: "green-light")
        let greenHiBtnImg = UIImage(named: "green-light-hi")
        greenBtn.setBackgroundImage(greenBtnImg, for: .normal)
        greenBtn.setBackgroundImage(greenHiBtnImg, for: .highlighted)
        greenBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greenBtn.bottomAnchor.constraint(equalTo: orangeBtn.topAnchor, constant: -35),
            greenBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            greenBtn.widthAnchor.constraint(equalToConstant: 60),
            greenBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configLightExplainImg() {
        view.addSubview(lightsExplainImg)
        lightsExplainImg.image = UIImage(named: "lights-explain")
        lightsExplainImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lightsExplainImg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            lightsExplainImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            lightsExplainImg.widthAnchor.constraint(equalToConstant: 250),
            lightsExplainImg.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
    
    
    func addBarButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        self.navigationItem.rightBarButtonItem = addButton
        addButton.tintColor = .systemRed
        
    }
    
    @objc func addHabit() {
        
        alert()
        
    }
    
    
    
    func clearBarButton() {
        let clearButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearHabit))
        self.navigationItem.leftBarButtonItem = clearButton
        clearButton.tintColor = .systemRed
    }
    
    @objc func clearHabit() {
        
        
    }
    
    
    func alert() {
        
        let dialogMessage = UIAlertController(title: "Enter your Habit", message: nil, preferredStyle: .alert)
        let label = UILabel(frame: CGRect(x: 0, y: 40, width: 270, height: 26))
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        dialogMessage.view.addSubview(label)
        
        
        let create = UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            if let userInput = self.habitTextField.text {
                if userInput == "" {
                    self.present(dialogMessage, animated: true, completion: nil)
                }
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        dialogMessage.addAction(cancel)
        dialogMessage.addAction(create)
        dialogMessage.addTextField { (textField) -> Void in
            self.habitTextField = textField
        }
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
}
