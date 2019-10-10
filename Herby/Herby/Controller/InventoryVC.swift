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
        
//        inventoryAddButton.backgroundColor = .red
//        let changedInventoryAddButton = UIImage(named: "icons8-add-60")?.withRenderingMode(.alwaysTemplate)
//        let cha = UIButton.image(inventoryAddButton).
//        inventoryAddButton.tintColor = .green
//        inventoryAddButton.im = changedInventoryAddButton
        
//        changingAddButtonView()
        inventoryAddButton.customFloatingActionButtonExt()
        
    }
    
}

