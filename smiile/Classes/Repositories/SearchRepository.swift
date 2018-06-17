//
//  SearchRepository.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import Foundation
import RxSwift

class SearchRepository {
    
    func searchAd(_ terms: String?) -> Observable<[SmallAd]> {
        if let terms = terms,
            terms.count > 0 {
            var ads = [SmallAd]()
            ads.append(SmallAd(type: .help,
                               title: "Besoin d'aide pour monter un meuble",
                               author: "Jean-Michel B.",
                               price: nil,
                               distance: "4km"))
            ads.append(SmallAd(type: .object,
                               title: "Besoin d'une perceuse à percution",
                               author: "Martin B.",
                               price: nil,
                               distance: "1km"))
            ads.append(SmallAd(type: .help,
                               title: "Cherche co-voiturage pour Disneyland",
                               author: "Sylvie A.",
                               price: 5.0,
                               distance: "7km"))
            return .just(ads)
        }
        return .just([])
        
    }
    
}
