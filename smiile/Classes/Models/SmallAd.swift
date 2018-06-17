//
//  SmallAd.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import Foundation

struct SmallAd {
    
    enum AdType {
        case help
        case object
    }
    
    let type: AdType
    let title: String
    let author: String
    let price: Float?
    let distance: String
}
