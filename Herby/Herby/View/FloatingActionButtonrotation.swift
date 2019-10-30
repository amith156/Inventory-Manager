//
//  FloatingActionButtonrotation.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 30/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import UIKit

class FloatingActionButtonrotation: UIButton {

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        transform = CGAffineTransform(rotationAngle: 180 * ( .pi / 180))
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform(rotationAngle: 135 * ( .pi / 180))
        }
        return true
    }

}
