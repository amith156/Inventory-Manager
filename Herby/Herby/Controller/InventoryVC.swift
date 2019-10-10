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
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Please type your item!"
            textField = alertText
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: .none)
        
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
    
    
    
}
extension InventoryVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inventoryArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablViewCellID", for: indexPath)
        cell.textLabel?.text = inventoryArrayList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.saveData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
