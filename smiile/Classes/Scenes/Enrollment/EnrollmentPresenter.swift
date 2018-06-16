//
//  EnrollmentPresenter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//

import Foundation
import RxSwift



struct EnrollmentViewModel {
    
    enum EnrollmentStep : Int {
        case emailPassword = 0
        case userInfos = 1
        case address = 2
    }
    
    let currentStep : EnrollmentStep
    let progress: Float
    let buttonContinueTitle: String
    
}

protocol EnrollmentModuleInterface : class {
    func attach()
}


class  EnrollmentPresenter : EnrollmentModuleInterface {
    private let bag = DisposeBag()
    ///Use the scheduler for debouce, Throttle, etc. The scheduler can be set in the constructor to facilitate tests.
    private let scheduler : SchedulerType
    
    private let router : EnrollmentRouterInput
    private let interactor : EnrollmentInteractorInput
    private weak var viewController : EnrollmentIntents?
    
    
    init(router : EnrollmentRouterInput,
         interactor : EnrollmentInteractorInput,
         viewController : EnrollmentIntents,
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
        
        let loadObs = viewController.loadIntent()
            .map { return EnrollmentViewModel.EnrollmentStep.emailPassword }
        
        let continueObs = viewController.continueIntent()
        
        Observable.merge([loadObs, continueObs])
            .map { step -> EnrollmentViewModel in
                let progress = Float(step.rawValue) / 3.0
                var title:String!
                switch step {
                case .emailPassword:
                    title = "Continuer"
                case .userInfos:
                    title = "Continuer"
                case .address:
                    title = "Finaliser mon inscription"
                }
                return EnrollmentViewModel(currentStep: step,
                                           progress: progress,
                                           buttonContinueTitle: title)
            }
            .subscribe(onNext: { [weak self] model in
                self?.viewController?.display(viewModel: model)
            })
            .disposed(by: bag)
        
        viewController.cancelIntent()
            .subscribe(onNext: { [weak self] in
                self?.router.go(to: .cancel)
            })
            .disposed(by: bag)
    }
    
    
    
}
