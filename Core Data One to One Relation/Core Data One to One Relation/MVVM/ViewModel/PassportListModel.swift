//
//  PassportListVC.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import Foundation

struct PassportListModel {
    
    let passportId, name: String
    let profilePicture: Data
    
    init(passportId: String, name: String, profilePicture: Data) {
        self.passportId = passportId
        self.name = name
        self.profilePicture = profilePicture
    }
}
