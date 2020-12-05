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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
    }
    
    
    
    func configBookImgBtn() {
        view.addSubview(bookImageBtn)
        let btnImg = UIImage(named: "book")
        
        bookImageBtn.setImage(btnImg, for: .normal)
        
        bookImageBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookImageBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            bookImageBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bookImageBtn.widthAnchor.constraint(equalToConstant: 160),
            bookImageBtn.heightAnchor.constraint(equalToConstant: 160)
            
            
        ])
        
        
    }
    
    
    
}
