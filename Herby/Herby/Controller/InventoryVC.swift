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
import RxSwift
import RxCocoa

class InventoryVC : UIViewController{
    
//    var inventoryArrayList = [InventoryListEntity]()
    var inventoryViewModel : InventoryViewModel = InventoryViewModel()
    var coreDataManagerVM : CoreDataManagerViewModel = CoreDataManagerViewModel()
    //This is for the Core Data Context
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuUIViewFAB: CircleViewForFloatingActionButton!
    @IBOutlet weak var floatingActionButton: FloatingActionButtonRotation!
    @IBOutlet weak var addTextFAMB: FloatingActionButtonRotation!
    @IBOutlet weak var objectReconFAMB: FloatingActionButtonRotation!
    @IBOutlet weak var textReconFAMB: FloatingActionButtonRotation!
    @IBOutlet weak var barCodeReconFAMB: FloatingActionButtonRotation!
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tableView.dataSource = self
//        tableView.delegate = self
//        inventoryViewModel.loadData()
        coreDataManagerVM.fetchSetupAllPersons()
        tableView.reloadData()
        menuCloseSetupFAB()
        
        
//        setUpAddToList()
//        populateTodoList()
        
//        let apiKey = "b503cdeb7efb4e5aa1b3f8c16a80312e"
//        let baseURL = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=2&apiKey=\(apiKey)"
//        urlSession(url: baseURL)
    }
    

    
    //MARK:- FAB operation
    @IBAction func floatingActionButtonIBAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            
            if self.menuUIViewFAB.transform == .identity {
                self.menuCloseSetupFAB()
                
            } else {
                self.menuUIViewFAB.transform = .identity
//                self.floatingActionButton.transform = .identity
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.15, initialSpringVelocity: 3, options: [], animations: {
            if self.menuUIViewFAB.transform == .identity {
                self.addTextFAMB.transform = .identity
                self.objectReconFAMB.transform = .identity
                self.textReconFAMB.transform = .identity
                self.barCodeReconFAMB.transform = .identity
            }
        })
        
    }
    
    func setUpAddToList() {
        addTextFAMB.rx.tap.subscribe(onNext : {
            print("xxxxx")
            self.floatingActionButtonIBAction(FloatingActionButtonRotation.self)
            var textField = UITextField()

            let alert =  UIAlertController(title: "Add item", message: "Please insert your inventory item.", preferredStyle: .alert)

            let action = UIAlertAction(title: "Add", style: .default) {
                (act) in

                //this is NSManger obj for every new item
//                let newItem = InventoryListEntity(context: self.context)
//                textField.rx.text.orEmpty.bind(to: self.inventoryViewModel.text).disposed(by: self.disposeBag)
                
//                if textField.text!.isEmpty != true {
//                    self.inventoryViewModel.addItemsToList(text: textField.text!)
//                }
                
//                self.tableView.reloadData()
//                self.inventoryViewModel.x()
    //
    //            if textField.text!.isEmpty != true {
    //                newItem.name = textField.text!
    //                self.inventoryViewModel.inventoryArrayList.append(newItem)
    //                self.customSaveDataItem()
    //            }
            }
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)

            alert.addTextField { (alertText) in
                alertText.placeholder = "Please type your item!"
                alertText.autocapitalizationType = .words
                alertText.autocorrectionType = .yes
                textField = alertText
            }

            alert.addAction(cancelButton)
            alert.addAction(action)
            alert.preferredAction = action

            self.present(alert, animated: true, completion: .none)

            if #available(iOS 13.0, *) {
                alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .secondarySystemBackground

            } else {
                // Fallback on earlier versions
            }

//            self.customSaveDataItem()
    
            
            }).disposed(by: disposeBag)
    }

    //MARK:- adding text to the list
    @IBAction func addItemTextToList(_ sender: FloatingActionButtonRotation) {
         self.floatingActionButtonIBAction(FloatingActionButtonRotation.self)
         var textField = UITextField()

         let alert =  UIAlertController(title: "Add item", message: "Please insert your inventory item.", preferredStyle: .alert)

         let action = UIAlertAction(title: "Add", style: .default) {
            (act) in

             //this is NSManger obj for every new item
//             let newItem = InventoryListEntity(context: self.inventoryViewModel.context)
//            let newItem = InventoryListEntity(context: CoreDataManager.coreDataSharedManager.persistentContainer.viewContext)

             if textField.text!.isEmpty != true {
//                 newItem.name = textField.text!
//                 self.inventoryViewModel.inventoryArrayList.append(newItem)
                self.coreDataManagerVM.insertNewData(itemName: textField.text!)
//                self.coreDataManagerVM.insertData(itemName: textField.text!)
                self.tableView.reloadData()
//                 self.customSaveDataItem()
             }
         }
         let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)

         alert.addTextField { (alertText) in
             alertText.placeholder = "Please type your item!"
             alertText.autocapitalizationType = .words
             alertText.autocorrectionType = .yes
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
        coreDataManagerVM.fetchSetupAllPersons()
        customSaveDataItem()
    }
    
}

//MARK:- Data Source
extension InventoryVC : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.coreDataManagerVM.inventoryArrayList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablViewCellID", for: indexPath)
//        cell.textLabel?.text = inventoryViewModel.inventoryArrayList[indexPath.row].name
        var s = coreDataManagerVM.inventoryArrayList[indexPath.row].value(forKeyPath: "name") as? String
        cell.textLabel?.text = coreDataManagerVM.inventoryArrayList[indexPath.row].value(forKeyPath: "name") as? String
        print("======> \(indexPath.row) -----> \(self.coreDataManagerVM.inventoryArrayList.count) -----> \(s!)")
        return cell
    }

    
}

//MARK:- Delegate
extension InventoryVC : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        context.delete(inventoryArrayList[indexPath.row])
//        inventoryArrayList.remove(at: indexPath.row)

        customSaveDataItem()
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
//MARK:- Methods for Swype Action for tableView
extension InventoryVC {

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // action one
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            self.editTextInventoryArrayList(text: self.coreDataManagerVM.inventoryArrayList[indexPath.row].value(forKey: "name") as! String,  indexPath: indexPath)
            
        })
        editAction.backgroundColor = UIColor.blue

        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.customDeleteItem(indexPath: indexPath)
        })
        deleteAction.backgroundColor = UIColor.red
        return [editAction, deleteAction]
        
    }

     
     @available(iOS 11.0, *)
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         return UISwipeActionsConfiguration(actions: [editIconeAction(at: indexPath), deleteIconeAction(at: indexPath)])
     }

     @available(iOS 11.0, *)
     func editIconeAction(at indexPath : IndexPath) -> UIContextualAction {
//        _ = inventoryViewModel.inventoryArrayList[indexPath.row]
         let action = UIContextualAction(style: .normal, title: "Edit") {
            (action, view, completion) in
            self.editTextInventoryArrayList(text: (self.coreDataManagerVM.inventoryArrayList[indexPath.row].value(forKey: "name")) as! String,  indexPath: indexPath)
            
            completion(true)
         }
         action.image = #imageLiteral(resourceName: "icons8-edit-40")
         action.backgroundColor = self.inventoryViewModel.hexStringToUIColor(hex: "#1201ff")
         return action
     }
     
     
     @available(iOS 11.0, *)
     func deleteIconeAction(at indexPath : IndexPath) -> UIContextualAction {
        var item = coreDataManagerVM.inventoryArrayList[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Delete") {
             (action, view, completion) in
            self.coreDataManagerVM.delete(itemListEntity: item as! InventoryListEntity)
            self.coreDataManagerVM.inventoryArrayList.remove(at: indexPath.row)
            self.customDeleteItem(indexPath: indexPath)
             completion(true)
         }
         
         action.image = #imageLiteral(resourceName: "icons8-delete-bin-40")
         action.backgroundColor = self.inventoryViewModel.hexStringToUIColor(hex: "#ff0200")
//         self.customDeleteItem(indexPath: indexPath)
         return action
     }
}



//MARK:- Custom Methods
extension InventoryVC {
    
    @objc func dismissAlertController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func editTextInventoryArrayList(text : String = "", indexPath : IndexPath) {
        var textField = UITextField()
        var item = coreDataManagerVM.inventoryArrayList[indexPath.row]
        let alert =  UIAlertController(title: "Edit item", message: "Please edit your inventory item.", preferredStyle: .alert)

        let action = UIAlertAction(title: "ok", style: .default) {
            (act) in

            //this is NSManger obj for every new item
//            let newItem = InventoryListEntity(context: self.context)

            if textField.text!.isEmpty != true {
//                newItem.name = textField.text!
//                self.inventoryViewModel.inventoryArrayList[indexPath.row].name = textField.text!
                self.coreDataManagerVM.inventoryArrayList[indexPath.row].setValue(textField.text!, forKey: "name")
                self.coreDataManagerVM.update(itemName: textField.text!, inventoryListEntity: item as! InventoryListEntity)
                self.customSaveDataItem()
            }
        }

        alert.addTextField { (alertText) in
            alertText.placeholder = "Please enter your item to edit!"
            alertText.text = text
            textField = alertText
            textField.text = alertText.text!
        }

        alert.addAction(action)
        alert.preferredAction = action

        self.present(alert, animated: true) {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
                alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func menuCloseSetupFAB() {
        menuUIViewFAB.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        addTextFAMB.transform = CGAffineTransform(translationX: 0, y: 20)
        objectReconFAMB.transform = CGAffineTransform(translationX: 5, y: 15)
        textReconFAMB.transform = CGAffineTransform(translationX: 15, y: 5)
        barCodeReconFAMB.transform = CGAffineTransform(translationX: 20, y: 0)
        floatingActionButton.transform = .identity
    }
    
    func customSaveDataItem() {
//        inventoryViewModel.saveData()
        tableView.reloadData()
    }

    func customDeleteItem(indexPath: IndexPath) {
        self.inventoryViewModel.deletingItems(indexPath: indexPath)
        self.tableView.deleteRows(at: [indexPath], with: .left)
//        self.inventoryViewModel.saveData()
    }
    
//    func customLoadDataItem(request : NSFetchRequest<InventoryListEntity> = nil) {
//        self.inventoryViewModel.loadData(request: request)
//        tableView.reloadData()
//    }
    
}

//MARK:- Search Bar
extension InventoryVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<InventoryListEntity> = InventoryListEntity.fetchRequest()
//
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!)
//
        let sortDiscriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDiscriptor]
//
////        self.inventoryViewModel.lodeItems(request: request)
        self.inventoryViewModel.loadData(request: request)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text?.count == 0) {
            self.inventoryViewModel.loadData()
            tableView.reloadData()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}





//extension InventoryVC {
//
//    func populateTodoList() {
//        //fetchObservableData returns the type of
//        self.inventoryViewModel.updateInventoryBehaviourList()
//        inventoryViewModel.inventoryBehaviourListToObservable().bind(to: tableView.rx.items(cellIdentifier: "TablViewCellID", cellType: UITableViewCell.self)) {
//            (row, element, cell) in
//            cell.textLabel?.text = element.name!
//        }.disposed(by: disposeBag)
//
////        tableView.rx.setDelegate(self)
//
//        tableView.rx.itemDeleted.subscribe {
//            (indexpath) in
//            print(indexpath)
////            IndexPath(row: indexpath.element, section: 0)
//            self.inventoryViewModel.deletingItems(indexPath: indexpath.element!)
//        }.disposed(by: disposeBag)
//
//    }
//
//}
