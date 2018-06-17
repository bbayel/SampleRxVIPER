//
//  OthersPresenter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct OthersViewModel {

    
}

protocol OthersModuleInterface : class {
    func attach()
}


class  OthersPresenter : OthersModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : OthersRouterInput
    private let interactor : OthersInteractorInput
    private weak var viewController : OthersIntents?
    
    
    init(router : OthersRouterInput,
         interactor : OthersInteractorInput,
         viewController : OthersIntents,
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
