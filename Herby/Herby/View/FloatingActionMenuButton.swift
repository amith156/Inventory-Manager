//
//  FloatingActionMenuButton.swift
//  Herby
//
//  Created by Admin 1 on 07/12/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import UIKit

class FloatingActionMenuButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customFloatingActionButtonExt()
    }

}
