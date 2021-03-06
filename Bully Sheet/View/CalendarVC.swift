//
//  CalendarVC.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 04/12/2020.
//  Calendar View

import UIKit
import FSCalendar

class CalendarVC: UIViewController, FSCalendarDelegate {
    
    var calendar = FSCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        calendar.delegate = self
        calendar.appearance.titleDefaultColor = UIColor.label //color in Dark mode
        self.calendar.firstWeekday = 2 //first day of Week is Monday
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.frame = CGRect(x: 0,
                                y: 100,
                                width: view.frame.size.width,
                                height: view.frame.size.width)
        view.addSubview(calendar)
        
        
    }
    
    
}



