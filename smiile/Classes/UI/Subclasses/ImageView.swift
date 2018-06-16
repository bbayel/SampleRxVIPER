//
//  ImageView.swift
//   
//
//  Created by Benjamin Bayel on 03/11/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

class ImageView: UIImageView {

    @IBInspectable var colorStyle: String = "" {
        didSet {
            if let colorStyle = ColorStyle(rawValue: colorStyle),
                let image = image {
                if image.renderingMode != .alwaysTemplate {
                    self.image = image.withRenderingMode(.alwaysTemplate)
                }
                let color = Style.color(colorStyle)
                tintColor = color
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
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
}
