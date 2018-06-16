//
//  CollectionReusableView.swift
//   
//
//  Created by Benjamin Bayel on 28/09/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    
    class func nib() -> UINib{
        return UINib(nibName: className, bundle: nil)
    }
    
    class func reuseIdentifier() -> String {
        return className
        
    }
}
