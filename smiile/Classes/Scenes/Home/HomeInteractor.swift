//
//  HomeInteractor.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import RxSwift

protocol  HomeInteractorInput  {
    func fetchDatas() -> Observable<Void>
}

struct HomeInteractor : HomeInteractorInput {
    
    func fetchDatas() -> Observable<Void> {
        return .just(())
    }

}
