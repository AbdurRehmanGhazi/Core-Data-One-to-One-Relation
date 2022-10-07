//
//  BaseProtocol.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation

protocol BaseRepository {
   
    associatedtype T
    
    func create(record: T)
    func getAll() -> [T]?
    func get(byIdentifier: UUID) -> T?
    func update(record: T) -> Bool
    func delete(byIdentifier: UUID) -> Bool
}
