//
//  CustomTabBar.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 04/12/2020.
//

import UIKit

class CustomTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemRed
        let bar1 = createTabBarController(vc: StartVC(), title: "Home", image: #imageLiteral(resourceName: "start-icon"))
        let bar2 = createTabBarController(vc: MainVC(), title: "Habits", image: #imageLiteral(resourceName: "main-icon"))
        let bar3 = createTabBarController(vc: CalendarVC(), title: "Overview", image: #imageLiteral(resourceName: "calendar-icon"))
        viewControllers = [bar1, bar2, bar3]
            }
    
    
    func createTabBarController(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
    
    
}
//
//
//
//

