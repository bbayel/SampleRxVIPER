//
//  SearchCollectionViewCell.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: CollectionViewCell {
    @IBOutlet weak var labelTitle: Label!
    @IBOutlet weak var labelPrice: Label!
    @IBOutlet weak var labelAuthor: Label!
    @IBOutlet weak var labelDistance: Label!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(_ ad: SmallAd) {
        if let price = ad.price {
            labelPrice.text = "\(price) €"
        }
        else {
            labelPrice.text = "Gratuit"
        }
        labelTitle.text = ad.title
        labelAuthor.text = ad.author
        labelDistance.text = "environ à \(ad.distance)"
    }
}
