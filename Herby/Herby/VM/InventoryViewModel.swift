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
import RxCocoa
import RxSwift


class InventoryViewModel {
    
//    var inventoryArrayList : [InventoryListEntity] = [InventoryListEntity]()
//    var inventoryArrayList : [NSManagedObject] = []
    
//    var inventoryBehaviorlist = BehaviorRelay<[InventoryListEntity]>(value: [])
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

//    let context = CoreDataManager.coreDataSharedManager.persistentContainer.viewContext
    
//    init(inventoryList : [InventoryListEntity]) {
//        self.inventoryArrayList = inventoryList
////        self.inventoryBehaviorlist.accept(inventoryList)
//
//    }
    

//    func inventoryBehaviourListToObservable() -> Observable<[InventoryListEntity]>{
//        return inventoryBehaviorlist.asObservable()
//    }
    
//    func updateInventoryBehaviourList() {
//        inventoryBehaviorlist.accept(inventoryArrayList)
////        loadData()
//        print("in value count----> \(inventoryArrayList.count)")
//        print("in value ----> \(inventoryArrayList)")
//        print("bh value count----> \(inventoryBehaviorlist.value.count)")
//    }
    
//    func addItemsToList(text : String) {
//        let newItem = InventoryListEntity(context: self.context)
//        newItem.name = text
//        inventoryArrayList.append(newItem)
//        saveData()
////        updateInventoryBehaviourList()
//    }
    
    func loadData(request : NSFetchRequest<InventoryListEntity> = InventoryListEntity.fetchRequest()) {
//        do {
//            inventoryArrayList = try context.fetch(request)
//        } catch {
//            print("-----> error in loading or fetching DB, \(error)")
//        }
    }
    
//    func saveData() {
//        do {
//            inventoryArrayList.forEach { (item) in
//                print("====> \(item.name!)")
//            }
//          try context.save()
//        } catch {
//            print("-----> error on saving data, \(error)")
//        }
////        reloadData()
//        print("-----> \(inventoryArrayList.count) \(inventoryArrayList)")
//    }
    
    func deletingItems(indexPath: IndexPath) {
//        context.delete(inventoryArrayList[indexPath.row])
//        inventoryArrayList.remove(at: indexPath.row)
//        updateInventoryBehaviourList()
//        inventoryVC.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        //saving the context without reloading tableview
        do {
//          try context.save()
        } catch {
            print("-----> error on saving data, \(error)")
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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