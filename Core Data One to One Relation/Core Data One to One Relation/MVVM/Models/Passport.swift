//
//  Passport.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation

class Passport {
    let id: UUID
    var passportId, placeOfIssue, name: String?
    
    init(id: UUID, passportId: String?, placeOfIssue: String?, name: String? = nil) {
        self.id = id
        self.passportId = passportId
        self.placeOfIssue = placeOfIssue
        self.name = name
    }
}
