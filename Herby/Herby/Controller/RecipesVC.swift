//
//  ViewController.swift
//  Herby
//
//  Created by Amith on 08/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import UIKit
import CoreData
class RecipesVC: UIViewController {

    var inventoryArrayList : [InventoryListEntity] = [InventoryListEntity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
        print(inventoryArrayList.count)
    }
    
    func fetchData() {
        
    }

}

