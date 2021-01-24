//
//  HabitCell.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 10/01/2021.
//

import UIKit

class HabitCell: UITableViewCell {
    
    var habitLabel = UILabel()
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
        habitLabel.preferredMaxLayoutWidth = 500
    
        
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            habitLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            habitLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            habitLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
            
        ])
    }
    
}
