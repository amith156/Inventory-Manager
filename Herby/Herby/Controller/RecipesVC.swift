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

//    var inventoryArrayList : [InventoryListEntity] = [InventoryListEntity]()
    var coreDataManagerVM : CoreDataManagerViewModel = CoreDataManagerViewModel()
    var peopler : [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        coreDataManagerVM.fetchSetupAllPersons()
        print("-----> \(coreDataManagerVM.inventoryArrayList.count)")
    }

    override func viewDidAppear(_ animated: Bool) {
        coreDataManagerVM.fetchSetupAllPersons()
        print("-----> \(coreDataManagerVM.inventoryArrayList.count)")
    }
    
    func fetchData() {
        
    }

}

