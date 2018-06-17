//
//  AddressRepository.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import Foundation
import RxSwift

class AddressRepository {
    
    func searchAddress(_ terms: String?) -> Observable<[String]> {
        if let terms = terms,
            terms.count > 0 {
            let response = ["17 rue de Satory, 78000 Versailles",
                            "17 rue Saint-Louis, 78000, Versailles",
                            "17 rue de Saint-Germain, 75009 Paris",
                            "17 rue de Général Leclerc, 75010 Paris",
                            "17 place de l'égalité, 78180 Montingy le Btx"]
            return .just(response)
        }
        return .just([])
    }
}
