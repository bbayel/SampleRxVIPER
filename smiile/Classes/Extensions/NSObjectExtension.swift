//
//  NSObjectExtension.swift
//  
//
//  Created by Benjamin Bayel on 28/09/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
