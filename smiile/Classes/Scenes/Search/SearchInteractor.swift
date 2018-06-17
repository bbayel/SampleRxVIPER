//
//  SearchInteractor.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import RxSwift

protocol  SearchInteractorInput  {
    func search(_ terms: String?) -> Observable<[SmallAd]>
}

struct SearchInteractor : SearchInteractorInput {
    
    let repository = SearchRepository()
    
    func search(_ terms: String?) -> Observable<[SmallAd]> {
        return repository.searchAd(terms)
    }

}
