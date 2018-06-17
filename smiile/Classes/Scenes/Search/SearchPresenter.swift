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
    let response:[SmallAd]?
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
        
        viewController.searchIntent()
            .flatMapLatest { [unonwed self] terms in
                return self.interactor.search(terms)
            }
            .map { result in
                return SearchViewModel(response: result)
            }
            .subscribe(onNext: { [weak self] model in
                self?.viewController?.display(viewModel: model)
            })
            .disposed(by: bag)
        
        viewController.notificationIntent()
            .subscribe(onNext: { [weak self] in
                self?.router.go(to: .mailbox)
            })
            .disposed(by: bag)
    }
    
    
    
}
