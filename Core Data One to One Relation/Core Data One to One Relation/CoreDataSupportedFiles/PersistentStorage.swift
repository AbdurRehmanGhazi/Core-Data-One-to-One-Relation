//
//  PersistentStorage.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 06/10/2022.
//

import Foundation
import CoreData

class PersistentStorage {
    
    static let shared = PersistentStorage()
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Core_Data_One_to_One_Relation")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    lazy var context = persistentContainer.viewContext

    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagerObjects<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            let results = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T]
            return results
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
