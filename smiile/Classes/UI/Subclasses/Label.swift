//
//  Label.swift
//   
//
//  Created by Benjamin Bayel on 26/09/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

class Label: UILabel {

    @IBInspectable var localizedText: String = "" {
        didSet {
            text = NSLocalizedString(localizedText, comment: "")
        }
    }
    
    @IBInspectable var fontStyle: String = "" {
        didSet {
            if let textStyle = TextStyle(rawValue: fontStyle) {
                font = Style.font(textStyle)
            }
        }
    }

    @IBInspectable var colorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: colorStyle) {
                textColor = Style.color(colorStyle)
            }
        }
    }
    
    @IBInspectable var letterSpacing: CGFloat = 0.0 {
        didSet {
            let string = NSLocalizedString(localizedText, comment: "")
            let attrString = NSMutableAttributedString(string: string)
            attrString.addAttribute(NSAttributedStringKey.kern,
                                    value: letterSpacing,
                                    range: NSRange(location: 0, length: string.count))
            attributedText = attrString
        }
    }
}
