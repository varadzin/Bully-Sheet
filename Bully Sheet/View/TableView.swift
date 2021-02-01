//
//  TableView.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 03/01/2021.
//

import UIKit
import CoreData

class TableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    
   
    var padding: CGFloat = 20
    
    
    var arrowLeftBtn = UIButton()
    var arrowRightBtn = UIButton()
    
    var dayLabel = UILabel()
    var todaysDate = String()
    var changeDate = Int()
//    var habitTextField = UITextField()
//    var userInput = String()
    var addHabitBtn = UIButton()
    var todayBtn = UIButton()
//    var yourHabits : [String] = []
//    var messageInWindow = String()
    var habitStatus = String()
    var colorsExplainText = UITextView()
//
//    var readHabit1 = String()
//    var readHabit2 = String()
//    var readHabit3 = String()
//    var readHabit4 = String()
//    var readHabit5 = String()
    
    var readDate = String()
//    var controlArray : [String] = []
    
    
    let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    private var models = [Habits]()
    
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
        getAllItems()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model  = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let color = models[indexPath.row]"🔴"
        cell.textLabel?.text = "\(model.color ?? "🔴")   \(model.name ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = models[indexPath.row]
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        //here you change color of habit in action sheet and save it in core data
        sheet.addAction(UIAlertAction(title: "🟢  Habit is completed", style: .default, handler: { [weak self] _ in
                       let newColor = "🟢"
                 self?.updateColor(item: item, newColor: newColor)
        }))
        
        
        
        sheet.addAction(UIAlertAction(title: "🟠  Not relevant today", style: .default, handler: { [weak self] _ in
                        let newColor = "🟠"
            self?.updateColor(item: item, newColor: newColor)
  }))
        
        
        
        sheet.addAction(UIAlertAction(title: "🔴  Habit uncompleted ", style: .default, handler: { [weak self] _ in
                        let newColor = "🔴"
            self?.updateColor(item: item, newColor: newColor)
  }))
        
        
        sheet.addAction(UIAlertAction(title: "Edit habit", style: .default, handler: { _ in
            
            let alert = UIAlertController(title: "Edit habit", message: "Edit your habit", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
                guard let field  = alert.textFields?.first,
                      let newName = field.text, !newName.isEmpty
                else {
                    return
                }
                self?.updateItem(item: item, newName: newName)
            }))
            self.present(alert, animated: true)
        }))
        
        sheet.addAction(UIAlertAction(title: "Delete habit", style: .destructive, handler: { [weak self] _ in
            self?.deleteItem(item: item)
        }))
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(sheet, animated: true)
    }
    
    
    
    func configTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
       tableView.register(HabitCell.self, forCellReuseIdentifier: "cell")
        
        
        
        
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
        
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


        addHabitBtn.setTitle("+", for: .normal)
        addHabitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 60)

        addHabitBtn.setTitleColor(.systemRed, for: .normal)
        
        addHabitBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addHabitBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addHabitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addHabitBtn.widthAnchor.constraint(equalToConstant: 120),
            addHabitBtn.heightAnchor.constraint(equalToConstant: 80)
        ])
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
 
        todayBtn.setTitleColor(.label, for: .normal)
        
 
        
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
            colorsExplainText.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30),
            colorsExplainText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            colorsExplainText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            colorsExplainText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
    }
    
    
    @objc func addHabit() {
        
        let alert = UIAlertController(title: "New Habit", message: "Enter new habit", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first,
                  let text = field.text, !text.isEmpty
            else { return }
            self?.createItem(name: text)
        }))
        present(alert, animated: true)
        
    }
    
  //Core Data
    
    func getAllItems() {
        
        do {
            models = try context.fetch(Habits.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
            
        }
        catch {
            print("Error by catching data")
        }
    }
    
      
    func createItem(name: String) {
        let newItem = Habits(context: context)
        newItem.name = name
        newItem.date = Date()
        newItem.color = "🔴"
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error by creating new item")
            
        }
    }
    
    func deleteItem(item: Habits) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error by deleting item")
        }
        
    }
    
    func updateItem(item: Habits, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error by updating item")
        }
    }
    
    func updateColor(item: Habits, newColor: String) {
        item.color = newColor
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error by updating color")
        }
    }
}
    
