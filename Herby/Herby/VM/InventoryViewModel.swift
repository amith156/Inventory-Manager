//
//  InventoryViewModel.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 26/12/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Alamofire
import SwiftyJSON

class InventoryViewModel {
    
    var inventoryArrayList : [InventoryListEntity]
    
    init(inventoryList : [InventoryListEntity]) {
        self.inventoryArrayList = inventoryList
    }

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func loadData() {
        let request : NSFetchRequest<InventoryListEntity> = InventoryListEntity.fetchRequest()
        do {
            inventoryArrayList = try context.fetch(request)
        } catch {
            print("-----> error in loading or fetching DB, \(error)")
        }
    }
    
    func saveData() {
        do {
          try context.save()
        } catch {
            print("-----> error on saving data, \(error)")
        }
//        reloadData()
        print("-----> \(inventoryArrayList.count)")
    }
    
    
    func deletingItems(indexPath: IndexPath) {
        context.delete(inventoryArrayList[indexPath.row])
        inventoryArrayList.remove(at: indexPath.row)
//        inventoryVC.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        //saving the context without reloading tableview
        do {
          try context.save()
        } catch {
            print("-----> error on saving data, \(error)")
        }
    }
    
    func urlSession(url : String) {
        Alamofire.request(url).responseJSON {
            (response) in
            if response.result.isSuccess {
                let json : JSON = JSON(response.result.value!)
                print("-----> \(json)")
            } else {
                
            }
        }
    }
    
}
