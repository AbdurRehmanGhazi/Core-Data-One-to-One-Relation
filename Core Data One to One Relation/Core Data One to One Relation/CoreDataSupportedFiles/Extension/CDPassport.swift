//
//  Passport.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation

extension CDPassport {
    
    func covertToPassport() -> Passport {
        return Passport(id: self.id!, passportId: self.passportId!, placeOfIssue: self.placeOfIssue, name: self.toEmployee?.name)
    }
}
