//
//  InventoryVC.swift
//  Herby
//
//  Created by Amith on 09/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import Foundation
import UIKit
class InventoryVC : UIViewController {
    
    @IBOutlet weak var inventoryAddButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        inventoryAddButton.customFloatingActionButtonExt()
        
    }
    
    
    @IBAction func inventoryAddButtonAction(_ sender: Any) {
        let alert =  UIAlertController(title: "Add inventory item", message: "Please insert your inventory item.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) {
            (act) in
            
        }
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Please type your todo!"
//            textField = alertText
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}
extension InventoryVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablViewCellID", for: indexPath)
        return cell
    }
    
    
}

