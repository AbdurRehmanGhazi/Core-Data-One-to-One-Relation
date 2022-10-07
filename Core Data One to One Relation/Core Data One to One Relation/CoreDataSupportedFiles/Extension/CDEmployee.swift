//
//  Employee.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation

extension CDEmployee {
    
    func convertToEmployee() -> Employee {
     
        return Employee(id: self.id!, name: self.name!, email: self.email!, profilePicture: self.profilePicture!, passport: self.toPassport!.covertToPassport())
    }
}
