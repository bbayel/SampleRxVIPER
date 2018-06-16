//
//  EnrollmentAddressPresenter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct EnrollmentAddressViewModel {
    let autocompleteResponse:[String]?
    let selectedAddress:String?
}

protocol EnrollmentAddressModuleInterface : class {
    func attach()
}


class  EnrollmentAddressPresenter : EnrollmentAddressModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : EnrollmentAddressRouterInput
    private let interactor : EnrollmentAddressInteractorInput
    private weak var viewController : EnrollmentAddressIntents?
    
    
    init(router : EnrollmentAddressRouterInput,
         interactor : EnrollmentAddressInteractorInput,
         viewController : EnrollmentAddressIntents,
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
        
        let selectionObs = viewController.selectionIntent()
            .startWith(nil)
        
        let textObs = viewController.textIntent()
            .flatMapLatest { [unowned self] input in
                return self.interactor.addressAutocomplete(input)
            }
        
        Observable.combineLatest(selectionObs, textObs)
            .map { selection, response in
                return EnrollmentAddressViewModel(autocompleteResponse: response,
                                                  selectedAddress: selection)
            }
            .subscribe(onNext: { [weak self] model in
                self?.viewController?.display(viewModel: model)
            })
            .disposed(by: bag)
    }
    
}
