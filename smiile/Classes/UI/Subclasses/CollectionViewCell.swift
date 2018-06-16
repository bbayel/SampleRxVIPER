//
//  CollectionViewCell.swift
//   
//
//  Created by Benjamin Bayel on 28/09/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    class func nib() -> UINib{
        return UINib(nibName: className, bundle: nil)
    }

    class func reuseIdentifier() -> String {
        return className
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        let newFrame = layoutAttributes.frame
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}

class AutomaticHeightCollectionViewCell : CollectionViewCell {
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.height = size.height
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}

class AutomaticWidthCollectionViewCell : CollectionViewCell {
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = size.width
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
