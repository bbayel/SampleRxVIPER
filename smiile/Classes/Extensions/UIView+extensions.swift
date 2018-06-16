//
//  UIView+extensions.swift
//  
//
//  Created by Benjamin Bayel on 30/01/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import UIKit

extension UIView {
    
    func addPinnedSubview(_ view: UIView) {
        addSubview(view)
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .top,
                                         multiplier: 1,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .left,
                                         multiplier: 1,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .bottom,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .bottom,
                                         multiplier: 1,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .right,
                                         multiplier: 1,
                                         constant: 0))
    }
}
