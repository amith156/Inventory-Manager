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
    
//    var inventoryArrayList : [NSManagedObject] = []
    //1
    static let coreDataSharedManager = CoreDataManager()
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
      let context = CoreDataManager.coreDataSharedManager.persistentContainer.viewContext
        
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
    
    //MARK:- fetch all items
    func fetchAllPersons() -> [InventoryListEntity]?{
      
      
      /*Before you can do anything with Core Data, you need a managed object context. */
      let managedContext = CoreDataManager.coreDataSharedManager.persistentContainer.viewContext
      
      /*As the name suggests, NSFetchRequest is the class responsible for fetching from Core Data.
       
       Initializing a fetch request with init(entityName:), fetches all objects of a particular entity. This is what you do here to fetch all Person entities.
       */
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "InventoryListEntity")
      
      /*You hand the fetch request over to the managed object context to do the heavy lifting. fetch(_:) returns an array of managed objects meeting the criteria specified by the fetch request.*/
      do {
        let people = try managedContext.fetch(fetchRequest)
        return people as? [InventoryListEntity]
      } catch let error as NSError {
        print("-----> Could not fetch. \(error), \(error.userInfo)")
        return nil
      }
    }
    

    
    
    //MARK:- insert operation
    func insert(name: String) -> InventoryListEntity? {
        let managedContext = CoreDataManager.coreDataSharedManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "InventoryListEntity",
        in: managedContext)!
        let inventoryItem = NSManagedObject(entity: entity, insertInto: managedContext)
        inventoryItem.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            return inventoryItem as? InventoryListEntity
            
        } catch let error as NSError {
            print("-----> Could not save. \(error), \(error.userInfo)")
            return nil
        }
        
        
//        inventoryItem.setValue(name, forKey: "name")
    }
    
//    func insertData(itemName : String) {
//        let item = CoreDataManager.coreDataSharedManager.insert(name: itemName)
//        if item != nil {
//            inventoryArrayList.append(item!)
//        }
//    }
    
    
    //MARK:- Update opertion
    func update(name:String, inventoryListEntity : InventoryListEntity) {
      
      let context = CoreDataManager.coreDataSharedManager.persistentContainer.viewContext
      
      do {
        inventoryListEntity.setValue(name, forKey: "name")
        do {
          try context.save()
          print("saved!")
        } catch let error as NSError  {
          print("Could not save \(error), \(error.userInfo)")
        } catch {
          
        }
      } catch {
        print("Error with request: \(error)")
      }
    }
    
    func update(itemName : String, inventoryListEntity : InventoryListEntity ) {
        
        CoreDataManager.coreDataSharedManager.update(name: itemName, inventoryListEntity: inventoryListEntity)
    }
    
    
    //MARK:- delete
    func delete(inventoryListItem : InventoryListEntity){
      
      
      let managedContext = CoreDataManager.coreDataSharedManager.persistentContainer.viewContext
      
      do {
        
        managedContext.delete(inventoryListItem)
        
      } catch {
        // Do something in response to error condition
        print(error)
      }
      
      do {
        try managedContext.save()
      } catch {
        // Do something in response to error condition
      }
    }
    
    
    
//    func delete(inventoryListItem: InventoryListEntity){
//      /*get reference to appdelegate file*/
//
//
//      /*get reference of managed object context*/
//      let managedContext = CoreDataManager.coreDataSharedManager.persistentContainer.viewContext
//
//      /*init fetch request*/
//      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "name")
//
//      /*pass your condition with NSPredicate. We only want to delete those records which match our condition*/
////      fetchRequest.predicate = NSPredicate(format: "ssn == %@" ,ssn)
//      do {
//
//        /*managedContext.fetch(fetchRequest) will return array of person objects [personObjects]*/
//        let item = try managedContext.fetch(fetchRequest)
//        var arrRemovedPeople = [InventoryListEntity]()
//        for i in item {
//
//          /*call delete method(aManagedObjectInstance)*/
//          /*here i is managed object instance*/
//          managedContext.delete(i)
//
//          /*finally save the contexts*/
//          try managedContext.save()
//
//          /*update your array also*/
//          arrRemovedPeople.append(i as! InventoryListEntity)
//        }
//        return arrRemovedPeople
//
//      } catch let error as NSError {
//        print("Could not fetch. \(error), \(error.userInfo)")
//    return nil
//      }
//
//    }
    
}
