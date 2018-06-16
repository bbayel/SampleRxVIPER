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
    
    @nonobjc class var twilightBlue: UIColor {
        return UIColor(red: 11.0 / 255.0, green: 79.0 / 255.0, blue: 101.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var butterscotch: UIColor {
        return UIColor(red: 249.0 / 255.0, green: 181.0 / 255.0, blue: 64.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkBlueGrey: UIColor {
        return UIColor(red: 28.0 / 255.0, green: 64.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkSkyBlue: UIColor {
        return UIColor(red: 53.0 / 255.0, green: 182.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var twilightBlue20: UIColor {
        return UIColor(red: 11.0 / 255.0, green: 79.0 / 255.0, blue: 101.0 / 255.0, alpha: 0.2)
    }
    
    @nonobjc class var pineGreen: UIColor {
        return UIColor(red: 8.0 / 255.0, green: 30.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var pineGreenTwo: UIColor {
        return UIColor(red: 11.0 / 255.0, green: 51.0 / 255.0, blue: 65.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightUnselectedGrey: UIColor {
        return UIColor(white: 228.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var windowsBlue: UIColor {
        return UIColor(red: 50.0 / 255.0, green: 157.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var denim: UIColor {
        return UIColor(red: 54.0 / 255.0, green: 110.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
    }
}
