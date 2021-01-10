//
//  CheckBox.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 10/01/2021.
//

import UIKit

class CheckBox: UIView {

    var checkBoxState = "red"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.label.cgColor
        layer.cornerRadius = frame.size.width / 2.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkBoxColor() {
       
        if checkBoxState == "red" {
            backgroundColor = .systemRed
        } else if checkBoxState == "orange" {
            backgroundColor = .systemOrange
        } else {
            backgroundColor = .systemGreen
            checkBoxState = "green"
        }
        
        
        
    }
    

}
