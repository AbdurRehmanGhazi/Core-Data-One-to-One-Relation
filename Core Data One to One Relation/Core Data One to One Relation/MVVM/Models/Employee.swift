//
//  Employee.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation

class Employee {
    
    let id: UUID
    var name, email: String
    var profilePicture: Data
    var passport: Passport?
    
    init(id: UUID, name: String, email: String, profilePicture: Data, passport: Passport? = nil) {
        self.id = id
        self.name = name
        self.email = name
        self.profilePicture = profilePicture
        self.passport = passport
    }
    
    func displayAllRecords() {
        print(id, name, email, profilePicture, passport)
        print(passport?.id, passport?.passportId, passport?.placeOfIssue)
    }
    
    func convertToEmployeeListModel() -> EmployeeListModel{
        return EmployeeListModel(name: name, email: email, profilePicture: profilePicture)
    }
    
    func convertToPassportListModel() -> PassportListModel {
        return PassportListModel(passportId: (passport?.passportId)!, name: name, profilePicture: profilePicture)
    }
}
