//
//  EmployeeListModel.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import Foundation

struct EmployeeListModel {
    
    let name, email: String
    let profilePicture: Data
    
    init(name: String, email: String, profilePicture: Data) {
        self.name = name
        self.email = email
        self.profilePicture = profilePicture
    }
}
