//
//  SearchPresenter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct SearchViewModel {

    
}

protocol SearchModuleInterface : class {
    func attach()
}


class  SearchPresenter : SearchModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : SearchRouterInput
    private let interactor : SearchInteractorInput
    private weak var viewController : SearchIntents?
    
    
    init(router : SearchRouterInput,
         interactor : SearchInteractorInput,
         viewController : SearchIntents,
         scheduler : SchedulerType = MainScheduler.instance ) {
        self.router = router
        self.interactor = interactor
        self.viewController = viewController
        self.scheduler = scheduler
    }
    
    deinit {
        print("Deinit \(self)")
    }

    
    func attach() {

        guard let viewController = viewController else { return }
        
    }
    

    
}
