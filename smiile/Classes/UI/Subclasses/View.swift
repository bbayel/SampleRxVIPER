//
//  View.swift
//   
//
//  Created by Benjamin Bayel on 31/10/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit
import QuartzCore

class View: UIView {

    @IBInspectable var colorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: colorStyle) {
                backgroundColor = Style.color(colorStyle)
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWith: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var borderColorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: borderColorStyle) {
                layer.borderColor = Style.color(colorStyle).cgColor
            }
        }
    }
    
    @IBInspectable var dropDownShadow: Bool = false {
        didSet {
            if dropDownShadow {
                layer.masksToBounds = false
                layer.shadowOffset = CGSize(width: 0, height: 12)
                layer.shadowRadius = 9
                layer.shadowOpacity = 1
            }
            else {
                layer.masksToBounds = true
                layer.shadowOffset = CGSize.zero
                layer.shadowRadius = 0
            }
        }
    }
    
    @IBInspectable var shadowColorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: shadowColorStyle) {
                layer.shadowColor = Style.color(colorStyle).cgColor
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if dropDownShadow {
            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        }
        else {
            layer.shadowPath = nil
        }
    }
}
