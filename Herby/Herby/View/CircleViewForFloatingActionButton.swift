//
//  CircleViewForFloatingActionButton.swift
//  Herby
//
//  Created by Amith Kumar Narayan on 30/10/2019.
//  Copyright © 2019 Amith. All rights reserved.
//

import UIKit

class CircleViewForFloatingActionButton: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.yellow
//        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    }
    
    
    
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
//    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath()
//        let center = CGPoint(x: rect.height + rect.width / 2, y: rect.height + rect.width / 2)
//
////        let rad = path.addArc(withCenter: center, radius: <#T##CGFloat#>, startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
//    }
}
