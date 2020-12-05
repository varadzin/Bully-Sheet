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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        
        configBookImgBtn()
        configBullyBtn()
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
    
    
    
    
    
    }
