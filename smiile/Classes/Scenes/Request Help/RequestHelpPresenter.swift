//
//  RequestHelpPresenter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct RequestHelpViewModel {

    
}

protocol RequestHelpModuleInterface : class {
    func attach()
}


class  RequestHelpPresenter : RequestHelpModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : RequestHelpRouterInput
    private let interactor : RequestHelpInteractorInput
    private weak var viewController : RequestHelpIntents?
    
    
    init(router : RequestHelpRouterInput,
         interactor : RequestHelpInteractorInput,
         viewController : RequestHelpIntents,
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
        
        viewController.publishIntent()
            .flatMapLatest { _ in
                return viewController.displaySuccessAlert()
            }
            .subscribe(onNext: { [weak self] in
                self?.router.go(to: .back)
            })
            .disposed(by: bag)
    }
    

    
}
