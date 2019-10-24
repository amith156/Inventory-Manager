//
//  InventoryVC.swift
//  Herby
//
//  Created by Amith on 09/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Alamofire
import SwiftyJSON

class InventoryVC : UIViewController{
    
    var inventoryArrayList = [InventoryListEntity]()
    
    //This is for the Core Data Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var inventoryAddButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        inventoryAddButton.customFloatingActionButtonExt()
        loadData()
        
//        let apiKey = "b503cdeb7efb4e5aa1b3f8c16a80312e"
//        let baseURL = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=2&apiKey=\(apiKey)"
//        urlSession(url: baseURL)
    }
    
    
    @IBAction func inventoryAddButtonAction(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert =  UIAlertController(title: "Add item", message: "Please insert your inventory item.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) {
            (act) in
            
            //this is NSManger obj for every new item
            let newItem = InventoryListEntity(context: self.context)
            
            if textField.text!.isEmpty != true {
                newItem.name = textField.text!
                self.inventoryArrayList.append(newItem)
                self.saveData()
            }
            
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Please type your item!"
            textField = alertText
        }
        
        alert.addAction(cancelButton)
        alert.addAction(action)
        alert.preferredAction = action
        
        present(alert, animated: true, completion: .none)
        
        if #available(iOS 13.0, *) {
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .secondarySystemBackground
            
        } else {
            // Fallback on earlier versions
        }
        print("+++> \(alert.view.subviews.count)")
        
        saveData()
    }
    
    
    func saveData() {
            do {
              try context.save()
            } catch {
                print("-----> error on saving data, \(error)")
            }
        tableView.reloadData()
        print("---> \(inventoryArrayList.count)")
    }
    
    
    func loadData() {
        let request : NSFetchRequest<InventoryListEntity> = InventoryListEntity.fetchRequest()
        do {
            inventoryArrayList = try context.fetch(request)
        } catch {
            print("-----> error in loading or fetching DB, \(error)")
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

extension InventoryVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inventoryArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablViewCellID", for: indexPath)
        cell.textLabel?.text = inventoryArrayList[indexPath.row].name
        return cell
    }
    
}

extension InventoryVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        context.delete(inventoryArrayList[indexPath.row])
//        inventoryArrayList.remove(at: indexPath.row)
        
        self.saveData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
