//
//  FloatingActionButtonrotation.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 30/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import UIKit

class FloatingActionButtonRotation: UIButton {

    //this is the initialiser for this button via programatically.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFAB()
    }
    
    //this is a initialiser for the button via storyboard.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpFAB()
    }

    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        transform = CGAffineTransform(rotationAngle: 180 * ( .pi / 180))
        UIView.animate(withDuration: 4.5) {
            if self.transform == .identity{
                self.transform = CGAffineTransform(rotationAngle: 135 * ( .pi / 180))
//                self.layer.shadowPath = CGPath(roundedRect: CGRect(x: 10, y: 10, width: 50, height: 50), cornerWidth: 0, cornerHeight: 5, transform: nil)
   
            } else {
                self.transform = .identity
                self.layer.shadowPath = CGPath(roundedRect: CGRect(x: 10, y: 10, width: 50, height: 50), cornerWidth: 0, cornerHeight: 5, transform: nil)
            }
        }
        return true
    }
    
    
    func setUpFAB() {
        customFloatingActionButtonExt()     //this is an extension of FloatingActionButtonExtension.swift file.
        
        
        
    }
    
    
}
