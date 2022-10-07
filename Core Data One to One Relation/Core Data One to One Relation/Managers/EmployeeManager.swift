//
//  EmployeeManager.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation

struct EmployeeManager {
   
    private let employeeDataRepository = EmployeeDataRepository()
    
    
    func createEmployee(employee: Employee) {
        if validatePassport(passport: employee.passport) == false {
            employee.passport = nil
        }
        employeeDataRepository.create(record: employee)
    }
    
    func fetchEmployee() -> [Employee]? {
        return employeeDataRepository.getAll()
    }
    
    func fetchEmployee(byIndentifier id: UUID) -> Employee? {
        return employeeDataRepository.get(byIdentifier: id)
    }
    
    func udpateEmployee(employee: Employee) -> Bool {
        return employeeDataRepository.update(record: employee)
    }
    
    func deleteEmployee(id: UUID) -> Bool {
        return employeeDataRepository.delete(byIdentifier: id)
    }
    
    func validatePassport(passport: Passport?) -> Bool {
        
        if passport == nil || passport?.passportId?.isEmpty == true || passport?.placeOfIssue?.isEmpty == true {
            return false
        }
        return true
    }
}
