//
//  ViewController.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import UIKit

class ViewController: UIViewController {

    let em = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let passport = Passport(id: UUID(), passportId: "12345", placeOfIssue: "Lahore")
//        let employee = Employee(id: UUID(), name: "Charga1", email: "charga@gmail.com", profilePicture: (UIImage.init(named: "img")?.pngData())!, passport: passport)
//        em.createEmployee(employee: employee)
        
//        let em1 = em.fetchEmployee(byIndentifier: UUID(uuidString: "FFFFAB16-B5BD-4A9E-9363-AB1DB0AD0B9C")!)
//        print(em1?.name)
//        em1?.name = "Charga Shah"
//        em1?.passport?.placeOfIssue = "Karaci"
//        em.udpateEmployee(employee: em1!)
//        em1?.displayAllRecords()
//
        em.fetchEmployee()?.forEach({ employee in
            print(employee.id, employee.passport?.placeOfIssue)
        })
//
//        let emp1 = em.fetchEmployee(byIndentifier: UUID(uuidString: "B1F15019-0B9A-4B03-851D-3F5E23802986")!)
//        print(emp1?.id, emp1?.name, emp1?.passport?.placeOfIssue)
        
//        let emp2 = em.deleteEmployee(id: UUID(uuidString: "ADF4C1BC-9372-499D-9C18-3BA0B02DE7E6")!)
//        print(emp2)
    }


}

