//
//  CoreDataManager.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 17/02/2020.
//  Copyright © 2020 Amith. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    //1
    static let sharedManager = CoreDataManager()
    //2.
    private init() {} // Prevent clients from creating another instance.
    
    //3
    lazy var persistentContainer: NSPersistentContainer = {
      
      let container = NSPersistentContainer(name: "InventoryListModel")
      
      
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
    
    //4
    func saveContext () {
      let context = CoreDataManager.sharedManager.persistentContainer.viewContext
      if context.hasChanges {
        do {
          try context.save()
        } catch {
          // Replace this implementation with code to handle the error appropriately.
          // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
      }
    }
    
    func insert(name: String) -> InventoryListEntity? {
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "InventoryListEntity",
        in: managedContext)!
        let inventoryItem = NSManagedObject(entity: entity,
        insertInto: managedContext)
        inventoryItem.setValue(name, forKey: "name")
        do {
            try managedContext.save()
            return inventoryItem as? InventoryListEntity
            
        } catch let error as NSError {
            print("-----> Could not save. \(error), \(error.userInfo)")
            return nil
        }
        
    }
}
