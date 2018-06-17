//
//  WantedPresenter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct WantedViewModel {

    
}

protocol WantedModuleInterface : class {
    func attach()
}


class  WantedPresenter : WantedModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : WantedRouterInput
    private let interactor : WantedInteractorInput
    private weak var viewController : WantedIntents?
    
    
    init(router : WantedRouterInput,
         interactor : WantedInteractorInput,
         viewController : WantedIntents,
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
        viewController.notificationIntent()
            .subscribe(onNext: { [weak self] in
                self?.router.go(to: .mailbox)
            })
            .disposed(by: bag)
    }
    

    
}
