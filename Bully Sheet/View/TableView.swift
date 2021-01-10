//
//  TableView.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 03/01/2021.
//

import UIKit

class TableView: UIViewController, UITableViewDelegate {
    

            
var myTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

func configTableView() {
    view.addSubview(myTableView)
    setTableViewDelegates()
    myTableView.rowHeight = 60
    
    
    
    
    view.backgroundColor = .systemPink
    
    myTableView.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
        myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    
    ])
    
}
    
    func setTableViewDelegates() {
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
    }
    
}

extension TableView: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        
        
    }
    
    
    
}
