//
//  EnrollmentEmailPasswordPresenter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct EnrollmentEmailPasswordViewModel {

    
}

protocol EnrollmentEmailPasswordModuleInterface : class {
    func attach()
}


class  EnrollmentEmailPasswordPresenter : EnrollmentEmailPasswordModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : EnrollmentEmailPasswordRouterInput
    private let interactor : EnrollmentEmailPasswordInteractorInput
    private weak var viewController : EnrollmentEmailPasswordIntents?
    
    
    init(router : EnrollmentEmailPasswordRouterInput,
         interactor : EnrollmentEmailPasswordInteractorInput,
         viewController : EnrollmentEmailPasswordIntents,
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
