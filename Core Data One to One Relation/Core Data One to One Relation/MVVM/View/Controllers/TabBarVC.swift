//
//  TabBarVC.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import UIKit

enum TabBarModules: Int {
    case createEmployee = 0
    case employeeList = 1
    case passportList = 2
}

class TabBarVC: UITabBarController {

    let createEmployeeVC = CreateEmployeeVC()
    let employeeListVC = EmployeeListVC()
    let passportListVC = PassportListVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabs()
        // Do any additional setup after loading the view.
    }
    

    func setupTabs() {
     
        let employeeListNC = NavigationController(rootViewController: employeeListVC)
        let passportListNC = NavigationController(rootViewController: passportListVC)
        
        tabBar.clipsToBounds = true
        
        viewControllers = [createEmployeeVC, employeeListNC, passportListNC]
        
        selectedIndex = selectedIndex
        
        tabBar.items![TabBarModules.createEmployee.rawValue].title = "Create Employee"
        tabBar.items![TabBarModules.employeeList.rawValue].title = "Employee List"
        tabBar.items![TabBarModules.passportList.rawValue].title = "Passport List"
        
        
    }

}
