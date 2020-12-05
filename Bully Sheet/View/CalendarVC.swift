//
//  CalendarVC.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 04/12/2020.
//

import UIKit

class CalendarVC: UIViewController {
    
    var calendarImg = UIImageView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
                view.backgroundColor = .systemBackground
    configCalendarImg()
    }
    
    
    func configCalendarImg() {
        view.addSubview(calendarImg)
        calendarImg.image = UIImage(named: "calendar")
        
        calendarImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendarImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calendarImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            calendarImg.widthAnchor.constraint(equalToConstant: 262),
            calendarImg.heightAnchor.constraint(equalToConstant: 284)
        ])
    }
    
}
