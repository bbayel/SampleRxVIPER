//
//  TextField.swift
//   
//
//  Created by Benjamin Bayel on 19/03/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import UIKit

class TextField: UITextField {

    @IBInspectable var localizedPlaceholder: String = "" {
        didSet {
            placeholder = NSLocalizedString(localizedPlaceholder, comment: "")
            if let font = self.font {
                attributedPlaceholder = NSAttributedString(string: NSLocalizedString(localizedPlaceholder, comment: ""),
                                                           attributes: [NSAttributedStringKey.foregroundColor:UIColor.gray,
                                                                        NSAttributedStringKey.font:font])
            }
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

}
