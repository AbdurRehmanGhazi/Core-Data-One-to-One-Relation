//
//  EmployeeDataRepository.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation
import CoreData

protocol EmployeeRepository: BaseRepository {
    
}

struct EmployeeDataRepository: EmployeeRepository {
   
    func create(record: Employee) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = record.id
        cdEmployee.name = record.name
        cdEmployee.email = record.email
        cdEmployee.profilePicture = record.profilePicture
        
        if record.passport != nil {
            let cdPassport = CDPassport(context: PersistentStorage.shared.context)
            cdPassport.id = record.passport?.id
            cdPassport.passportId = record.passport?.passportId
            cdPassport.placeOfIssue = record.passport?.placeOfIssue
            
            cdEmployee.toPassport = cdPassport
        }
        
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        
        let cdEmployees = PersistentStorage.shared.fetchManagerObjects(managedObject: CDEmployee.self)
        
        var employees: [Employee] = []
        
        cdEmployees?.forEach { emp in
            employees.append(emp.convertToEmployee())
        }
        return employees
    }
    
    func get(byIdentifier: UUID) -> Employee? {
        let cdEmployee = getEmployee(byIdentifier: byIdentifier)
        guard cdEmployee != nil else { return nil }
        return cdEmployee?.convertToEmployee()
    }
    
    func update(record: Employee) -> Bool {
        let cdEmployee = getEmployee(byIdentifier: record.id)
        guard cdEmployee != nil else { return false }
        
        cdEmployee?.name = record.name
        cdEmployee?.email = record.email
        cdEmployee?.profilePicture = record.profilePicture
        
        if record.passport != nil {
//            let cdPassport = CDPassport(context: PersistentStorage.shared.context)
            cdEmployee?.toPassport?.passportId = record.passport?.passportId
            cdEmployee?.toPassport?.placeOfIssue = record.passport?.placeOfIssue
        }
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byIdentifier: UUID) -> Bool {
        let cdEmployee = getEmployee(byIdentifier: byIdentifier)
        guard cdEmployee != nil else { return false }
        
        PersistentStorage.shared.context.delete(cdEmployee!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func getEmployee(byIdentifier id: UUID) -> CDEmployee? {
        let fetchRecords = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicte = NSPredicate(format: "id=%@", id as CVarArg)
        fetchRecords.predicate = predicte
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRecords).first
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    typealias T = Employee
    
    
}
