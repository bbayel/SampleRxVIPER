//
//  WantedInteractor.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import RxSwift

protocol  WantedInteractorInput  {
    func smallAds() -> Observable<[SmallAd]>
}

struct WantedInteractor : WantedInteractorInput {
    
    let repository = AdRepository()
    
    func smallAds() -> Observable<[SmallAd]> {
        return repository.ads()
    }

}
