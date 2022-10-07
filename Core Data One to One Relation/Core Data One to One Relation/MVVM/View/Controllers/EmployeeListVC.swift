//
//  EmployeeListVC.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let employeeManager = EmployeeManager()
    private var employees: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "EmployeeeListCell", bundle: nil), forCellReuseIdentifier: "EmployeeeListCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        employees.removeAll()
        employeeManager.fetchEmployee()?.forEach({ employee in
            employees.append(employee)
        })
        tableView.reloadData()
    }
}

extension EmployeeListVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = EmployeeeListCell.TableViewCell(tableView: tableView, indexPath: indexPath)
        cell.employeeListModel = employees[indexPath.row].convertToEmployeeListModel()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let vc = UpdateDeleteEmployeeVC()
        vc.employee = employees[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
