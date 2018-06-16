//
//  Button.swift
//
//
//  Created by Benjamin Bayel on 17/10/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    @IBInspectable var localizedText: String = "" {
        didSet {
            setTitle(NSLocalizedString(localizedText, comment: ""), for: .normal)
        }
    }
    
    @IBInspectable var fontStyle: String = "" {
        didSet {
            if let textStyle = TextStyle(rawValue: fontStyle) {
                titleLabel?.font = Style.font(textStyle)
            }
        }
    }
    
    @IBInspectable var colorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: colorStyle) {
                let color = Style.color(colorStyle)
                setTitleColor(color, for: .normal)
                imageView?.tintColor = color
            }
        }
    }

    @IBInspectable var backgroundColorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: backgroundColorStyle) {
                let color = Style.color(colorStyle)
                setBackgroundImage(UIImage(color: color), for: .normal)
            }
        }
    }

    @IBInspectable var borderColorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: borderColorStyle) {
                let color = Style.color(colorStyle)
                layer.borderColor = color.cgColor
                if borderWidth == 0 {
                    borderWidth = 1.0
                }
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable var letterSpacing: CGFloat = 0.0 {
        didSet {
            let string = NSLocalizedString(localizedText, comment: "")
            let attrString = NSMutableAttributedString(string: string)
            attrString.addAttribute(NSAttributedStringKey.kern,
                                    value: letterSpacing,
                                    range: NSRange(location: 0, length: string.count))
            setAttributedTitle(attrString, for: .normal)
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
    
    @IBInspectable var isTextUnderlined: Bool = false {
        didSet {
            if isTextUnderlined {
                var attrs : [NSAttributedStringKey : Any] = [
                    NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue
                ]
                if let textStyle = TextStyle(rawValue: fontStyle) {
                    attrs[NSAttributedStringKey.font] = Style.font(textStyle)
                }
                
                if let colorStyle = ColorStyle(rawValue: colorStyle) {
                    let color = Style.color(colorStyle)
                    attrs[NSAttributedStringKey.foregroundColor] = color
                }
                
                setAttributedTitle(NSAttributedString(string: NSLocalizedString(localizedText, comment: ""), attributes: attrs), for: .normal)
            }
            else {
                setTitle(NSLocalizedString(localizedText, comment: ""), for: .normal)
            }
        }
    }
}
