//
//  EnrollmentSuccessPresenter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct EnrollmentSuccessViewModel {

    
}

protocol EnrollmentSuccessModuleInterface : class {
    func attach()
}


class  EnrollmentSuccessPresenter : EnrollmentSuccessModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : EnrollmentSuccessRouterInput
    private let interactor : EnrollmentSuccessInteractorInput
    private weak var viewController : EnrollmentSuccessIntents?
    
    
    init(router : EnrollmentSuccessRouterInput,
         interactor : EnrollmentSuccessInteractorInput,
         viewController : EnrollmentSuccessIntents,
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

//        guard let viewController = viewController else { return }
        
    }
    

    
}
