//
//  HabitCell.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 10/01/2021.
//

import UIKit

class HabitCell: UITableViewCell {

 var habitLabel = UILabel()
    var checkBox = CheckBox(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(habitLabel)
        addSubview(checkBox)
        
        configHabitLbl()
        configCheckBox()
        
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
            habitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            habitLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
            }
    
    func configCheckBox() {
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50)
        ])
        
    }
    
    

}
