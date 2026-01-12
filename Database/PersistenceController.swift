//
//  PersistenceController.swift
//  
//
//  Created by Florijan Stankir on 12.01.2026..
//

import Foundation
import CoreData

final class PersistenceController {
    
    // MARK: - Singleton
    static let shared = PersistentController()
    
    // MARK: - Core Data stack
    let container: NSPersistentContainer
    
    // MARK: - init
    private init(inMemory: Bool = false) {
        
        container = NSPersistentContainer(name: "BibleDataModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved Core Data error \(error), \(error.userInfo)")
            }
        }
        
        // MARK: - Context configuration
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: - Contexts
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    func newBackgroundContext() -> NSManagedObjectContext {
        container.newBackgroundContext()
    }
    
    // MARK: - Save
    func saveContext() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved Core Data save error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
