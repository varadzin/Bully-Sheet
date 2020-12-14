//
//  StartVC.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 04/12/2020.
//

import UIKit

class StartVC: UIViewController {
    
    var padding: CGFloat = 20
    var bookImageBtn = UIButton()
    var bullyBtn = UIButton()
    var firstChapBtn = UIButton()
    var howBtn = UIButton()
    var buyBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        
        configBookImgBtn()
        configBullyBtn()
        configFirstChapBtn()
        configHowBtn()
        configBuyBtn()
        
    }
    
    
    
    func configBookImgBtn() {
        view.addSubview(bookImageBtn)
        let btnImg = UIImage(named: "book")
        bookImageBtn.setBackgroundImage(btnImg, for: .normal)
        bookImageBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookImageBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            bookImageBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bookImageBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            bookImageBtn.heightAnchor.constraint(equalTo: bookImageBtn.widthAnchor)
        ])
    }
    
    func configBullyBtn() {
        view.addSubview(bullyBtn)
        
        bullyBtn.addTarget(self, action: #selector(bullyBtnTapped), for: .touchUpInside)
        
        let bullyBtnImg = UIImage(named: "bully")
        let bullyHiBtnImg = UIImage(named: "bully-hi")
        bullyBtn.setBackgroundImage(bullyBtnImg, for: .normal)
        bullyBtn.setBackgroundImage(bullyHiBtnImg, for: .highlighted)
        bullyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bullyBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bullyBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bullyBtn.widthAnchor.constraint(equalToConstant: 260),
            bullyBtn.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configFirstChapBtn() {
        view.addSubview(firstChapBtn)
        let firstChapBtnImg = UIImage(named: "first-chapter")
        let firstChapHiBtnImg = UIImage(named: "first-chapter-hi")
        firstChapBtn.setBackgroundImage(firstChapBtnImg, for: .normal)
        firstChapBtn.setBackgroundImage(firstChapHiBtnImg, for: .highlighted)
        firstChapBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstChapBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            firstChapBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            firstChapBtn.widthAnchor.constraint(equalToConstant: 90),
            firstChapBtn.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configHowBtn() {
        view.addSubview(howBtn)
        
        let howBtnImg = UIImage(named: "how")
        let howHiBtnImg = UIImage(named: "how-hi")
        howBtn.setBackgroundImage(howBtnImg, for: .normal)
        howBtn.setBackgroundImage(howHiBtnImg, for: .highlighted)
        howBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            howBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            howBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            howBtn.widthAnchor.constraint(equalToConstant: 90),
            howBtn.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configBuyBtn() {
        view.addSubview(buyBtn)
        
        let buyBtnImg = UIImage(named: "buy")
        let buyHiBtnImg = UIImage(named: "buy-hi")
        buyBtn.setBackgroundImage(buyBtnImg, for: .normal)
        buyBtn.setBackgroundImage(buyHiBtnImg, for: .highlighted)
        buyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buyBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            buyBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            buyBtn.widthAnchor.constraint(equalToConstant: 90),
            buyBtn.heightAnchor.constraint(equalToConstant: 90)
            
        ])
    }
    
    @objc func bullyBtnTapped() {
                   
    

     
                navigationController?.pushViewController(MainVC(), animated: true)
            }
        
    
    
}
// test









// test
