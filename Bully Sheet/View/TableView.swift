//
//  TableView.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 03/01/2021.
//

import UIKit
import CoreData

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
    var yourHabits : [String] = ["", "", "", "", ""]
    var messageInWindow = String()
    var habitStatus = String()
    var colorsExplainText = UITextView()
    
    var readHabit1 = String()
    var readHabit2 = String()
    var readHabit3 = String()
    var readHabit4 = String()
    var readHabit5 = String()
    
    var readDate = String()
    var controlArray : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemBackground
        dateOnScreen()
        configDayBtn()
        configArrowLBtn()
        configArrowRBtn()
        configTableView()
        colorsExplain()
        configAddHabitBtn()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        showData()
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
//
//        addHabitBtn.layer.borderWidth = 0.2
//        addHabitBtn.layer.borderColor = UIColor.systemRed.cgColor
//        addHabitBtn.layer.cornerRadius = 10
        addHabitBtn.setTitle("+", for: .normal)
        addHabitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 60)
//        addHabitBtn.titleLabel?.textAlignment = .center
        addHabitBtn.setTitleColor(.systemRed, for: .normal)
        
        addHabitBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addHabitBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addHabitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addHabitBtn.widthAnchor.constraint(equalToConstant: 120),
            addHabitBtn.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    
    //        todayBtn.addTarget(self, action: #selector(goToday), for: .touchUpInside)
    
    
    
    
    func configArrowLBtn() {
        view.addSubview(arrowLeftBtn)
        
        arrowLeftBtn.setTitle("<<", for: .normal)
        arrowLeftBtn.setTitleColor(.label, for: .normal)
        arrowLeftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        arrowLeftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
        
        arrowLeftBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrowLeftBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            arrowLeftBtn.trailingAnchor.constraint(equalTo: todayBtn.leadingAnchor, constant: -10),
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
            arrowRightBtn.leadingAnchor.constraint(equalTo: todayBtn.trailingAnchor, constant: 5),
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
 
        loadData()
             showData()
        configDayBtn()
    }
    
    
    @objc func rightBtnTapped() {
        changeDate = changeDate + 1
        
        if changeDate >= 1 {
            hideRightBtn()
        } else {
            showRightBtn()
            
        }
        
        dateOnScreen()
//
        loadData()
             showData()
        configDayBtn()
    }
    
    
    
    
    @objc func goToday() {
        
        
        changeDate = 0
        dateOnScreen()
        configDayBtn()
        
    }
    
    func configDayBtn() {
        view.addSubview(todayBtn)
        
        
        todayBtn.setTitle("\(todaysDate)", for: .normal)
        //
        todayBtn.setTitleColor(.label, for: .normal)
        
        //        todayBtn.textAlignment = .center
        //        todayBtn.font = UIFont.systemFont(ofSize: 18)
        
        todayBtn.addTarget(self, action: #selector(goToday), for: .touchUpInside)
        
        todayBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            todayBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todayBtn.widthAnchor.constraint(equalToConstant: 220),
            todayBtn.heightAnchor.constraint(equalToConstant: 30)
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
                    if self.yourHabits[0] == "" {
                        self.yourHabits[0] = userInput
                    } else {
                        if self.yourHabits[1] == "" {
                            self.yourHabits[1] = userInput
                    } else {
                        if self.yourHabits[2] == "" {
                            self.yourHabits[2] = userInput
                        } else {
                            if self.yourHabits[3] == "" {
                                self.yourHabits[3] = userInput
                            } else {
                                if self.yourHabits[4] == "" {
                                    self.yourHabits[4] = userInput
                            }
                            }
                        }
                    }
                    }
            
            
//                    self.yourHabits.append(userInput)
                    print(self.yourHabits)
                    self.saveData()
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
        cell.habitLabel.minimumScaleFactor = 12
       
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
    
    
    func saveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let entityName = "Habits"
 
        
        guard let newEntity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            return
                 }
     
        
        
        let newHabit = NSManagedObject(entity: newEntity, insertInto: context)
   
        
//        let habitToSave1 = habit1
//        let habitToSave2 = habit2
//        let habitToSave3 = habit3
//        let habitToSave4 = habit4
//        let habitToSave5 = habit5
//        let novyDatum = todaysDate
        
//
//        if yourHabits[0] != "" { newHabit.setValue(yourHabits[0], forKey: "first_habit")}
//        if yourHabits[1] != "" { newHabit.setValue(yourHabits[1], forKey: "second_habit")}
//        if yourHabits[2] != "" {  newHabit.setValue(yourHabits[2], forKey: "third_habit")}
//        if yourHabits[3] != "" {  newHabit.setValue(yourHabits[3], forKey: "fourth_habit")}
//        if yourHabits[4] != "" {  newHabit.setValue(yourHabits[4], forKey: "fifth_habit")}
        
        
      newHabit.setValue(yourHabits[0], forKey: "first_habit")
      newHabit.setValue(yourHabits[1], forKey: "second_habit")
       newHabit.setValue(yourHabits[2], forKey: "third_habit")
         newHabit.setValue(yourHabits[3], forKey: "fourth_habit")
        newHabit.setValue(yourHabits[4], forKey: "fifth_habit")
        newHabit.setValue(todaysDate, forKey: "datum")
        
        do {
            try context.save()
            print("datum: \(todaysDate) 1: \(yourHabits[0]) 2: \(yourHabits[1]) 3: \(yourHabits[2]) 4: \(yourHabits[3]) 5: \(yourHabits[4])" )
        } catch {
            print(error)
        }
        
    }
    
    
    func loadData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
                    }
        
        let context = appDelegate.persistentContainer.viewContext
        let entityName = "Habits"

        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

       
        
        do {
            let results = try context.fetch(request)
            
            for r in results {
                if let result = r as? NSManagedObject {
                    
//                    print("Results: \(results)")
                    
                    if result.value(forKey: "first_habit") == nil { print("no value1")} else {
                        yourHabits[0] = "\(result.value(forKey: "first_habit") as! String)"
                        controlArray.append(result.value(forKey: "first_habit") as! String)
                    }

                    if result.value(forKey: "second_habit") == nil { print("no value2")} else {
                        yourHabits[1] = "\(result.value(forKey: "second_habit") as! String)"
                        controlArray.append(result.value(forKey: "second_habit") as! String)
                    }
                    
                    if result.value(forKey: "third_habit") == nil { print("no value3")} else {
                        readHabit3 = result.value(forKey: "third_habit") as! String
                        controlArray.append(result.value(forKey: "third_habit") as! String)
                    }
                    
                        if result.value(forKey: "fourth_habit") == nil { print("no value4")} else {
                            readHabit4 = result.value(forKey: "fourth_habit") as! String
                            controlArray.append(result.value(forKey: "fourth_habit") as! String)
                        }
                    
                            if result.value(forKey: "fifth_habit") == nil { print("no value5")} else {
                                readHabit5 = result.value(forKey: "fifth_habit") as! String
                                controlArray.append(result.value(forKey: "fifth_habit") as! String)
                            }
                    
                    
                    readDate = result.value(forKey: "datum") as! String
                 
                }
            }
        } catch {
            print("Error - catch by loadData")
        }
         
              
        
    }
    
    func showData() {

        print("controlArray je: \(controlArray)")
        
        
//            yourHabits[0] = readHabit1
//
//
//        yourHabits[1] = readHabit2
//        yourHabits[2] = readHabit3
//        yourHabits[3] = readHabit4
//        yourHabits[4] = readHabit5
        print("novy nacitany datum je: \(readDate)")
        
    }
    
}



