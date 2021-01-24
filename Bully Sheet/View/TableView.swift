//
//  TableView.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 03/01/2021.
//

import UIKit

class TableView: UIViewController {
    

            
var myTableView = UITableView()
    var padding: CGFloat = 20
    

    var arrowLeftBtn = UIButton()
    var arrowRightBtn = UIButton()

    var dayLabel = UILabel()
    var todaysDate = String()
    var changeDate = Int()
    var habitTextField = UITextField()
    var userInput = String()
    var addHabitBtn = UIButton()
    var todayBtn = UIButton()
    var yourHabits : [String] = []
    var messageInWindow = String()
    var habitStatus = String()
    var colorsExplainText = UITextView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .systemBackground
        dateOnScreen()
        configDayLabel()
        configArrowLBtn()
        configArrowRBtn()
        
      
       
  
        configTableView()
        colorsExplain()
    
    
        configAddHabitBtn()
//        configTodayBtn()
    }

  
    
    
func configTableView() {
    view.addSubview(myTableView)
    setTableViewDelegates()
    myTableView.rowHeight = 50
    myTableView.register(HabitCell.self, forCellReuseIdentifier: "HabitCell")
    
    
    
    

    
    myTableView.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
        myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
        
        myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        myTableView.heightAnchor.constraint(equalToConstant: 300)
    
    ])
    
}
    
    func setTableViewDelegates() {
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    func hideRightBtn() {
        arrowRightBtn.isHidden = true
    }
    
    func showRightBtn() {
        arrowRightBtn.isHidden = false
  
    }
    
    
  //set day and date to show
    func dateOnScreen() {
let today = Date()
let midnight = Calendar.current.startOfDay(for: today)
let myDate = Calendar.current.date(byAdding: .day, value: changeDate, to: midnight)!

let weekday = Calendar.current.component(.weekday, from: myDate)
 let month = Calendar.current.component(.month, from: myDate)
 let date = Calendar.current.component(.day, from: myDate)
let year = Calendar.current.component(.year, from: myDate)
     
        switch changeDate {
        case 0:
            todaysDate = "Today"
        case -1:
            todaysDate = "Yesterday"
        case 1:
            todaysDate = "Tomorrow"
        default:
        
    todaysDate = "\(Calendar.current.weekdaySymbols[weekday-1])  \(date). \(Calendar.current.shortMonthSymbols[month-1]) \(year)"
        }
}
    
    func configAddHabitBtn() {
        view.addSubview(addHabitBtn)
        
        addHabitBtn.addTarget(self, action: #selector(addHabit), for: .touchUpInside)
        
        addHabitBtn.layer.borderWidth = 0.2
        addHabitBtn.layer.borderColor = UIColor.systemRed.cgColor
        addHabitBtn.layer.cornerRadius = 10
        addHabitBtn.setTitle("Add Habbit", for: .normal)
        addHabitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        addHabitBtn.setTitleColor(.systemRed, for: .normal)
        
        addHabitBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addHabitBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addHabitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addHabitBtn.widthAnchor.constraint(equalToConstant: 100),
            addHabitBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
        
//        todayBtn.addTarget(self, action: #selector(goToday), for: .touchUpInside)
        
            
    @objc func goToday() {
        
       
        changeDate = 0
        dateOnScreen()
        configDayLabel()
        
    }
    
    func configArrowLBtn() {
        view.addSubview(arrowLeftBtn)
        
        arrowLeftBtn.setTitle("<<", for: .normal)
        arrowLeftBtn.setTitleColor(.label, for: .normal)
        arrowLeftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        arrowLeftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
        
        arrowLeftBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrowLeftBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            arrowLeftBtn.trailingAnchor.constraint(equalTo: dayLabel.leadingAnchor, constant: -10),
            arrowLeftBtn.widthAnchor.constraint(equalToConstant: 50),
            arrowLeftBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
       
    }
    
    
    func configArrowRBtn() {
            
        
        view.addSubview(arrowRightBtn)
        
    
        arrowRightBtn.setTitle(">>", for: .normal)
        arrowRightBtn.setTitleColor(.label, for: .normal)
        arrowRightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        arrowRightBtn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
        
        arrowRightBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrowRightBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            arrowRightBtn.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 5),
            arrowRightBtn.widthAnchor.constraint(equalToConstant: 50),
            arrowRightBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
       
    }
    
    
    @objc func leftBtnTapped() {
    changeDate = changeDate - 1
        if changeDate >= 1 {
            hideRightBtn()
        } else {
            showRightBtn()
           
        }
    dateOnScreen()
      
        configDayLabel()
    }


    @objc func rightBtnTapped() {
    changeDate = changeDate + 1
        
        if changeDate >= 1 {
            hideRightBtn()
        } else {
            showRightBtn()
           
        }
        
    dateOnScreen()
        
        configDayLabel()
    }
    
    func configDayLabel() {
        view.addSubview(dayLabel)
        
        dayLabel.text = "\(todaysDate)"
        dayLabel.textColor = .label
        dayLabel.textAlignment = .center
        dayLabel.font = UIFont.systemFont(ofSize: 18)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            dayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dayLabel.widthAnchor.constraint(equalToConstant: 220),
            dayLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func colorsExplain() {
        view.addSubview(colorsExplainText)
        colorsExplainText.text = "🟢 Completed     🟠 Not relevant today     🔴 Uncompleted"
        colorsExplainText.textColor = .label
        colorsExplainText.font = UIFont.systemFont(ofSize: 12)
    
        
        colorsExplainText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorsExplainText.topAnchor.constraint(equalTo: myTableView.bottomAnchor, constant: 30),
            colorsExplainText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            colorsExplainText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            colorsExplainText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
                                
    }
    
    
    @objc func addHabit() {
        
        alert()
        
    }
    
    
    
    
    
    func alert() {
        
        if yourHabits.count >= 4 {
            messageInWindow = "Too much habits wont work"
        } else {
            messageInWindow = ""
        }
        
        
        let dialogMessage = UIAlertController(title: "Enter your Habit", message: messageInWindow, preferredStyle: .alert)
        let label = UILabel(frame: CGRect(x: 0, y: 40, width: 270, height: 26))
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        dialogMessage.view.addSubview(label)
        
        
        let create = UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            if let userInput = self.habitTextField.text {
                if userInput == "" {
                    self.present(dialogMessage, animated: true, completion: nil)
                } else {
                self.yourHabits.append(userInput)
                print(self.yourHabits)
                    self.myTableView.reloadData()
                }}

        }
        )
        
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        dialogMessage.addAction(cancel)
        dialogMessage.addAction(create)
        dialogMessage.addTextField { (textField) -> Void in
            self.habitTextField = textField
        }
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
}

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yourHabits.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "HabitCell") as! HabitCell
//        let cell = myTableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath)
//        cell.textLabel?.text = "\(yourHabits[indexPath.row])"
        cell.habitLabel.text = "\(yourHabits[indexPath.row])"
       
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            yourHabits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
     
            let completeGreen = completeAction(at: indexPath)
        let notTodayOrange = notTodayAction(at: indexPath)
        let notCompleteRed = notCompleteAction(at: indexPath)
            return UISwipeActionsConfiguration(actions: [completeGreen, notTodayOrange, notCompleteRed])
            
        }
        
        func completeAction(at indexPath: IndexPath) -> UIContextualAction {
            let actionGreen = UIContextualAction(style: .normal, title: "Complete") { (action, view, completition) in
                self.habitStatus = "green"
                
                completition(true)
            }
            actionGreen.title = "🟢"
            actionGreen.backgroundColor = .white
            
           
        return actionGreen
        }
    
    func notTodayAction(at indexPath: IndexPath) -> UIContextualAction {
        let actionOrange = UIContextualAction(style: .normal, title: "Not relevant Today") { (action, view, completition) in
            self.habitStatus = "orange"
            
            completition(true)
        }
        actionOrange.title = "🟠"
        actionOrange.backgroundColor = .systemGray5
       
    return actionOrange
    }
    
    func notCompleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let actionRed = UIContextualAction(style: .normal, title: "Not Complete") { (action, view, completition) in
            self.habitStatus = "red"
            
            completition(true)
        }
        actionRed.title = "🔴"
        actionRed.backgroundColor = .white
       
    return actionRed
    }
    
    
    }
    
    

