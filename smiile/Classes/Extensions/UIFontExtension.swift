//
//  UIFontExtension.swift
//  
//
//  Created by Benjamin Bayel on 27/10/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func regular(_ size: CGFloat = 15) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }

    class func bold(_ size: CGFloat = 15) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    class func light(_ size: CGFloat = 15) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }

    class func italic(_ size: CGFloat = 15) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
    }

}
