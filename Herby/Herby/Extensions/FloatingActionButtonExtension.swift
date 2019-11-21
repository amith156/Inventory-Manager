//
//  FloatingActionButtonExtension.swift
//  Herby
//
//  Created by Amith on 10/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import UIKit

extension UIButton {
    
    func customFloatingActionButtonExt() {
        backgroundColor = .red
        tintColor = .white
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 2)
//        layer.shadowPath = CGPath(roundedRect: CGRect(x: 10, y: 10, width: 50, height: 50), cornerWidth: 0, cornerHeight: 5, transform: nil)
//        layer.removeFromSuperlayer()
        
    }
}
