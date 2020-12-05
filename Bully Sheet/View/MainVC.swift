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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addBarButton()
        clearBarButton()
        configLightExplainImg()
       
        configOrangeBtn()
        configRedBtn()
        configGreenBtn()
        
        
    }
    func configOrangeBtn() {
        view.addSubview(orangeBtn)
        let orangeBtnImg = UIImage(named: "orange-light")
        let orangeHiBtnImg = UIImage(named: "orange-light-hi")
        orangeBtn.setBackgroundImage(orangeBtnImg, for: .normal)
        orangeBtn.setBackgroundImage(orangeHiBtnImg, for: .highlighted)
       orangeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orangeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
        
        
    }
    
    
    
    func clearBarButton() {
        let clearButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearHabit))
        self.navigationItem.leftBarButtonItem = clearButton
        clearButton.tintColor = .systemRed
    }
    
    @objc func clearHabit() {
        
        
    }
    
}
