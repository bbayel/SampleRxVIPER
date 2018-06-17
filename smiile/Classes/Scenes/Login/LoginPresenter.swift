//
//  LoginPresenter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct LoginViewModel {
    
    
}

protocol LoginModuleInterface : class {
    func attach()
}


class  LoginPresenter : LoginModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : LoginRouterInput
    private let interactor : LoginInteractorInput
    private weak var viewController : LoginIntents?
    
    
    init(router : LoginRouterInput,
         interactor : LoginInteractorInput,
         viewController : LoginIntents,
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
        
        viewController.registerIntent()
            .subscribe(onNext: { [weak self] in
                self?.router.go(to: .enrollment)
            })
            .disposed(by: bag)
        
        viewController.loginIntent()
            .subscribe(onNext: { [weak self] in
                self?.router.go(to: .home)
            })
            .disposed(by: bag)
    }
    
    
    
}
