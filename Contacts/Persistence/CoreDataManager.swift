//
//  CoreDataManager.swift
//  Contacts
//
//  Created by Abhishek Shukla on 15/04/25.
//

// Persistence/CoreDataManager.swift

import CoreData

//final class CoreDataManager {
//    static let shared = CoreDataManager()
//
//    let container: NSPersistentContainer
//
//    private init() {
//        container = NSPersistentContainer(name: "ContactsModel") // Use your actual Core Data model name
//        container.loadPersistentStores { _, error in
//            if let error = error {
//                fatalError("CoreData load failed: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    var context: NSManagedObjectContext {
//        container.viewContext
//    }
//
//    func saveContext() {
//        guard context.hasChanges else { return }
//        do {
//            try context.save()
//        } catch {
//            print("Failed to save context: \(error.localizedDescription)")
//        }
//    }
//}
