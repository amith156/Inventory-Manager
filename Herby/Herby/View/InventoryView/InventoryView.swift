//
//  InventoryCellView.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 27/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import Foundation
import UIKit

class InvntoryView : UIViewController {
    
    var inventoryVC = InventoryVC()
    
    @IBOutlet weak var inventoryAddButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        inventoryAddButton.customFloatingActionButtonExt()
    }

    @IBAction func inventoryAddButtonAction(_ sender: Any) {

        var textField = UITextField()

        let alert =  UIAlertController(title: "Add item", message: "Please insert your inventory item.", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add", style: .default) {
            (act) in

            //this is NSManger obj for every new item
            let newItem = InventoryListEntity(context: self.inventoryVC.context)

            if textField.text!.isEmpty != true {
                newItem.name = textField.text!
                self.inventoryVC.inventoryArrayList.append(newItem)
                self.inventoryVC.saveData()
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

//            saveData()
    }
    

}
    
    

