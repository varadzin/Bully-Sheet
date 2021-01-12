//
//  TableView.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 03/01/2021.
//

import UIKit

class TableView: UIViewController, UITableViewDelegate {
    

            
var myTableView = UITableView()
    var padding: CGFloat = 20
    
    var redBtn = UIButton()
    var orangeBtn = UIButton()
    var greenBtn = UIButton()
    var arrowLeftBtn = UIButton()
    var arrowRightBtn = UIButton()
    var lightsExplainImg = UIImageView()
    var dayLabel = UILabel()
    var todaysDate = String()
    var changeDate = Int()
    var habitTextField = UITextField()
    var userInput = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        view.backgroundColor = .systemBackground
        
        addBarButton()
        dateOnScreen()
        configDayLabel()
        configLightExplainImg()
        configArrowLBtn()
        configArrowRBtn()
    }

func configTableView() {
    view.addSubview(myTableView)
    setTableViewDelegates()
    myTableView.rowHeight = 60
    myTableView.register(HabitCell.self, forCellReuseIdentifier: "HabitCell")
    
    
    
    
    view.backgroundColor = .systemPink
    
    myTableView.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
        myTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        myTableView.heightAnchor.constraint(equalToConstant: 300)
    
    ])
    
}
    
    func setTableViewDelegates() {
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
    }
    



    
    
    func dateOnScreen() {
let today = Date()
let midnight = Calendar.current.startOfDay(for: today)
let myDate = Calendar.current.date(byAdding: .day, value: changeDate, to: midnight)!

let weekday = Calendar.current.component(.weekday, from: myDate)
 let month = Calendar.current.component(.month, from: myDate)
 let date = Calendar.current.component(.day, from: myDate)
let year = Calendar.current.component(.year, from: myDate)
    todaysDate = "\(Calendar.current.weekdaySymbols[weekday-1])  \(date). \(Calendar.current.shortMonthSymbols[month-1]) \(year)"
}
    
    
    func configArrowLBtn() {
        view.addSubview(arrowLeftBtn)
        
        arrowLeftBtn.setTitle("<<", for: .normal)
        arrowLeftBtn.setTitleColor(.label, for: .normal)
        arrowLeftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        arrowLeftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
        
        arrowLeftBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrowLeftBtn.bottomAnchor.constraint(equalTo: myTableView.topAnchor, constant: -padding),
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
            arrowRightBtn.bottomAnchor.constraint(equalTo: myTableView.topAnchor, constant: -padding),
            arrowRightBtn.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 5),
            arrowRightBtn.widthAnchor.constraint(equalToConstant: 50),
            arrowRightBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
       
    }
    
    @objc func leftBtnTapped() {
    changeDate = changeDate - 1
    dateOnScreen()
      
        configDayLabel()
    }


    @objc func rightBtnTapped() {
    changeDate = changeDate + 1
    dateOnScreen()
        
        configDayLabel()
    }
    
    func configDayLabel() {
        view.addSubview(dayLabel)
        
        dayLabel.text = "\(todaysDate)"
        dayLabel.textColor = .label
        dayLabel.textAlignment = .center
        dayLabel.font = UIFont(name: "Arial", size: 18)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayLabel.bottomAnchor.constraint(equalTo: myTableView.topAnchor, constant: -padding),
            dayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dayLabel.widthAnchor.constraint(equalToConstant: 220),
            dayLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func configLightExplainImg() {
        view.addSubview(lightsExplainImg)
        lightsExplainImg.image = UIImage(named: "lights-explain")
        lightsExplainImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lightsExplainImg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            lightsExplainImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            lightsExplainImg.widthAnchor.constraint(equalToConstant: 250),
            lightsExplainImg.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
    
    
    func addBarButton() {
        let addButton = UIBarButtonItem(title: "Add habit", style: .done, target: self, action: #selector(addHabit))
        self.navigationItem.rightBarButtonItem = addButton
        addButton.tintColor = .systemRed
        
    }
    
    @objc func addHabit() {
        
        alert()
        
    }
    
    
    
    
    
    func alert() {
        
        let dialogMessage = UIAlertController(title: "Enter your Habit", message: nil, preferredStyle: .alert)
        let label = UILabel(frame: CGRect(x: 0, y: 40, width: 270, height: 26))
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        dialogMessage.view.addSubview(label)
        
        
        let create = UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            if let userInput = self.habitTextField.text {
                if userInput == "" {
                    self.present(dialogMessage, animated: true, completion: nil)
                }
    
}

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

extension TableView: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "HabitCell") as! HabitCell
        
        
        
        return cell
        
        
    }
}
