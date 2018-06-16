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
    let imageNameButtonCancel: String
    
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
        let cancelObs = viewController.cancelIntent()
            .do(onNext: { [weak self] step in
                if step == nil {
                    self?.router.go(to: .cancel)
                }
            })
            .filter { $0 != nil }
            .map { $0! }

        Observable.merge([loadObs, continueObs, cancelObs])
            .map { step -> EnrollmentViewModel in
                let progress = Float(step.rawValue) / 3.0
                var title:String!
                var imageName:String!
                switch step {
                case .emailPassword:
                    title = "Continuer"
                    imageName = "icon_close"
                case .userInfos:
                    title = "Continuer"
                    imageName = "icon_back"
                case .address:
                    title = "Finaliser mon inscription"
                    imageName = "icon_back"
                }
                return EnrollmentViewModel(currentStep: step,
                                           progress: progress,
                                           buttonContinueTitle: title,
                                           imageNameButtonCancel: imageName)
            }
            .subscribe(onNext: { [weak self] model in
                self?.viewController?.display(viewModel: model)
            })
            .disposed(by: bag)
        
    }
    
    
    
}
