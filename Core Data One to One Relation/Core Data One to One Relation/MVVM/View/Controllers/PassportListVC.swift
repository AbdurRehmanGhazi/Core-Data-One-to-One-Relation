//
//  PassportListVC.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import UIKit

class PassportListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var employee: [Employee] = []
    private let employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "PassportListCell", bundle: nil), forCellReuseIdentifier: "PassportListCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        employee.removeAll()
        employeeManager.fetchEmployee()?.forEach({ employe in
            self.employee.append(employe)
        })
        tableView.reloadData()
    }

}

extension PassportListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PassportListCell.TableViewCell(tableView: tableView, indexPath: indexPath)
        cell.passportListModel = employee[indexPath.row].convertToPassportListModel()
        return cell
    }
}
