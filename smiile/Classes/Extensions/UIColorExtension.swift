//
//  UIColorExtension.swift
//  
//
//  Created by Benjamin Bayel on 27/09/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexString:String) {

        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    class var randomColor : UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    class var smiileBlue: UIColor {
        return UIColor(hexString: "#4AAAD4")
    }
    
    class var smiileYellow: UIColor {
        return UIColor(hexString: "#F8D648")
    }
}
