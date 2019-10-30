//
//  InventoryViewModel.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 28/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import Foundation
struct InventoryViewModel {
    let name : String
    
    // Dependency Injection (DI)
    init(name : String) {
        self.name = name
    }
}
