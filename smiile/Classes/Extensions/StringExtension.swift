//
//  StringExtension.swift
//  
//
//  Created by Benjamin Bayel on 27/10/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedStringKey.font: font],
                                            context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedStringKey.font: font],
                                            context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func truncated() -> String {
        if count > 13 {
            return String(prefix(10)) + "..."
        }
        return self
    }
    
    func camelCase() -> String {
        var string = self.replacingOccurrences(of: "_", with: " ")
        string = string.capitalized
        string = string.replacingOccurrences(of: " ", with: "")
        if string.count > 1 {
            string = string.prefix(1).lowercased() + string.dropFirst(1)
        }
        
        return string
    }
}
