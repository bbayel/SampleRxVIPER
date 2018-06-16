//
//  EnrollmentController.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol EnrollmentIntents : class {
    func loadIntent() -> Observable<Void>
    func continueIntent() -> Observable<EnrollmentViewModel.EnrollmentStep>
    func cancelIntent() -> Observable<Void>
    func display(viewModel : EnrollmentViewModel)
}



class EnrollmentController : UIViewController, EnrollmentIntents {
    
    var presenter : EnrollmentModuleInterface!
    let bag = DisposeBag()
    var viewModel: EnrollmentViewModel?
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    @IBOutlet weak var buttonClose: Button!
    @IBOutlet weak var buttonContinue: Button!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var containerEmailPassword: UIView!
    @IBOutlet weak var containerUserInfos: UIView!
    @IBOutlet weak var containerAddress: UIView!
    
    var emailPasswordVc: EnrollmentEmailPasswordController!
    var userInfosVc: EnrollmentUserInfosController!
    var addressVc: EnrollmentEmailPasswordController!

    //MARK:-  View LifeCycle
    deinit {
        print("Deinit \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        
        progressBar.progressTintColor = .smiileYellow
        
        setupSubcontrollers()
    }
    
    func setupSubcontrollers() {
        
        emailPasswordVc = EnrollmentEmailPasswordRouter.instantiateController()
        userInfosVc = EnrollmentUserInfosRouter.instantiateController()
        addressVc = EnrollmentEmailPasswordRouter.instantiateController()

        addChild(emailPasswordVc, inView: containerEmailPassword, withInsets: .zero)
        addChild(userInfosVc, inView: containerUserInfos, withInsets: .zero)
        addChild(addressVc, inView: containerAddress, withInsets: .zero)
    }
    
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    func cancelIntent() -> Observable<Void> {
        return buttonClose.rx.tap.asObservable()
    }
    
    func continueIntent() -> Observable<EnrollmentViewModel.EnrollmentStep> {
        return buttonContinue.rx.tap.asObservable()
            .map { [weak self] _ in
                if let step = self?.viewModel?.currentStep,
                    let nextStep = EnrollmentViewModel.EnrollmentStep(rawValue: step.rawValue + 1) {
                    return nextStep
                }
                return EnrollmentViewModel.EnrollmentStep.address
        }
    }
    
    //MARK:- Display
    func display(viewModel: EnrollmentViewModel) {
        
        self.viewModel = viewModel
        
            switch viewModel.currentStep {
            case .emailPassword:
                scrollViewContainer.scrollRectToVisible(containerEmailPassword.frame, animated: true)
            case .userInfos:
                scrollViewContainer.scrollRectToVisible(containerUserInfos.frame, animated: true)
            case .address:
                scrollViewContainer.scrollRectToVisible(containerAddress.frame, animated: true)
        }
        
        if let title = buttonContinue.title(for: .normal),
            title != viewModel.buttonContinueTitle {
            buttonContinue.setTitle(viewModel.buttonContinueTitle, for: .normal)
        }
        progressBar.setProgress(viewModel.progress, animated: true)
    }
    
}
