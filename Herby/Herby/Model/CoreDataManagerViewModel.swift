//
//  CoreDataManagerViewModel.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 22/02/2020.
//  Copyright © 2020 Amith. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManagerViewModel {
    
    var inventoryArrayList : [NSManagedObject] = []
    static let coreDataSharedManagerVM = CoreDataManagerViewModel()
    
//    init() {
//        fetchSetupAllPersons()
//    }
    
    
    func insertNewData(itemName : String) {
        let item = CoreDataManager.coreDataSharedManager.insert(name: itemName)
        if item != nil {
            inventoryArrayList.append(item!)
        }
    }


    
    
    func update(itemName : String, inventoryListEntity : InventoryListEntity ) {

        CoreDataManager.coreDataSharedManager.update(name: itemName, inventoryListEntity: inventoryListEntity)
    }
    
    func fetchSetupAllPersons(){

      if CoreDataManager.coreDataSharedManager.fetchAllPersons() != nil{
        
        inventoryArrayList = CoreDataManager.coreDataSharedManager.fetchAllPersons()!
        for i in inventoryArrayList {
//            print("(i)-> \(i)")
        }

      }
    }

    
    func delete(itemListEntity : InventoryListEntity) {
        CoreDataManager.coreDataSharedManager.delete(inventoryListItem: itemListEntity)
        
    }
    
}
