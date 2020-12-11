//
//  HabitLabel.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 05/12/2020.
//

import UIKit

class HabitLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configHabitLbl()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
       
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    
    func configHabitLbl() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray5.cgColor
        
        textColor = .systemGray5
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 12
        
        
        
    }
    
    
}
