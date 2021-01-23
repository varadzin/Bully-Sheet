//
//  HabitCell.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 10/01/2021.
//

import UIKit

class HabitCell: UITableViewCell {

 var habitLabel = UILabel()
//    var checkBox = CheckBox(frame: CGRect(x: 0, y: 0, width: 30, height: 30))


    var habitStatus = String()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(habitLabel)
     configHabitLbl()
     
      
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
    
    func configHabitLbl() {
        habitLabel.numberOfLines = 0
        habitLabel.adjustsFontSizeToFitWidth = true
    
     
        
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            habitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            habitLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            habitLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
            
        ])
            }
   
    

    
}
