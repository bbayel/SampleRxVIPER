//
//  Style.swift
//
//
//  Created by Benjamin on 24/05/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import UIKit

enum TextStyle:String {

    
    case Bold50 = "bold50"
    case Bold22 = "bold22"
    case Bold20 = "bold20"
    case Bold17 = "bold17"
    case Bold15 = "bold15"

    case Regular30 = "regular30"
    case Regular25 = "regular25"
    case Regular22 = "regular22"
    case Regular20 = "regular20"
    case Regular18 = "regular18"
    case Regular17 = "regular17"
    case Regular15 = "regular15"
    case Regular14 = "regular14"
    case Regular13 = "regular13"

    case Light28 = "light28"
    case Light25 = "light25"
    case Light20 = "light20"
    case Light17 = "light17"
    case Light15 = "light15"
    case Light13 = "light13"
    case Light11 = "light11"
    
    case Italic30 = "italic30"
    case Italic18 = "italic18"
}

enum ColorStyle:String {
    case Black = "black"
    case White = "white"
}

struct Style {
    
    static func color(_ forColorStyle: ColorStyle) -> UIColor {
        switch forColorStyle {
        case .Black:
            return .black
        case .White:
            return .white
        }
    }
    
    static func font(_ forTextStyle:TextStyle) -> UIFont {
        switch forTextStyle {

        case .Bold50:
            return UIFont.bold(50)
        case .Bold22:
            return UIFont.bold(22)
        case .Bold20:
            return UIFont.bold(20)
        case .Bold17:
            return UIFont.bold(17)
        case .Bold15:
            return UIFont.bold(15)
            
        case .Regular30:
            return UIFont.regular(30)
        case .Regular25:
            return UIFont.regular(25)
        case .Regular22:
            return UIFont.regular(22)
        case .Regular20:
            return UIFont.regular(20)
        case .Regular18:
            return UIFont.regular(18)
        case .Regular17:
            return UIFont.regular(17)
        case .Regular15:
            return UIFont.regular(15)
        case .Regular14:
            return UIFont.regular(14)
        case .Regular13:
            return UIFont.regular(13)

        case .Light28:
            return UIFont.light(28)
        case .Light25:
            return UIFont.light(25)
        case .Light20:
            return UIFont.light(20)
        case .Light17:
            return UIFont.light(17)
        case .Light15:
            return UIFont.light(15)
        case .Light13:
            return UIFont.light(13)
        case .Light11:
            return UIFont.light(11)

        case .Italic30:
            return UIFont.italic(30)
        case .Italic18:
            return UIFont.italic(18)
        }
    }
        
}

