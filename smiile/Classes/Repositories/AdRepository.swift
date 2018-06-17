//
//  AdRepository.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import Foundation
import RxSwift

class AdRepository {
    
    func ads() -> Observable<[SmallAd]> {
     
        var ads = [SmallAd]()
        ads.append(SmallAd(type: .object,
                           title: "Besoin d'une perceuse à percution",
                           author: "Martin B.",
                           price: nil,
                           distance: "1km"))
        ads.append(SmallAd(type: .object,
                           title: "Cherche une machine à crêpe",
                           author: "Benoit M.",
                           price: 15.0,
                           distance: "1km"))
        ads.append(SmallAd(type: .object,
                           title: "Cherche boule à facettes",
                           author: "Sarah C.",
                           price: nil,
                           distance: "3km"))
        ads.append(SmallAd(type: .help,
                           title: "Besoin d'aide pour monter un meuble",
                           author: "Jean-Michel B.",
                           price: nil,
                           distance: "4km"))
        ads.append(SmallAd(type: .help,
                           title: "Cherche Dog-sitter",
                           author: "Roger C.",
                           price: 20.0,
                           distance: "5km"))
        ads.append(SmallAd(type: .help,
                           title: "Cherche co-voiturage pour Disneyland",
                           author: "Sylvie A.",
                           price: 5.0,
                           distance: "7km"))
        ads.append(SmallAd(type: .help,
                           title: "Cherche garde de chat",
                           author: "Nathalie P.",
                           price: 20.0,
                           distance: "17km"))
        ads.append(SmallAd(type: .object,
                           title: "Cherche remorque bâteau",
                           author: "Marc T.",
                           price: nil,
                           distance: "37km"))
        return .just(ads)
        
    }
    
}
