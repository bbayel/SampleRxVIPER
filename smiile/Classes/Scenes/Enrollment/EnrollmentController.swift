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
import RxKeyboard

protocol EnrollmentIntents : class {
    func loadIntent() -> Observable<Void>
    func continueIntent() -> Observable<EnrollmentViewModel.EnrollmentStep>
    func cancelIntent() -> Observable<EnrollmentViewModel.EnrollmentStep?>
    func display(viewModel : EnrollmentViewModel)
}



class EnrollmentController : UIViewController, EnrollmentIntents {
    
    var presenter : EnrollmentModuleInterface!
    let bag = DisposeBag()
    var buttonContinueBag = DisposeBag()
    var viewModel: EnrollmentViewModel?
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    @IBOutlet weak var buttonClose: Button!
    @IBOutlet weak var buttonContinue: Button!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
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
        setupSubcontrollers()
        presenter.attach()
        progressBar.progressTintColor = .smiileYellow
        observeKeyboard()
    }
    
    func observeKeyboard() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [weak self] keyboardVisibleHeight in
                var bottomPadding:CGFloat = 0
                var topPadding:CGFloat = 0
                if #available(iOS 11.0, *) {
                    if let window = UIApplication.shared.keyWindow {
                        bottomPadding = window.safeAreaInsets.bottom
                        topPadding = window.safeAreaInsets.top
                    }
                }
                self?.bottomConstraint.constant = max(keyboardVisibleHeight - bottomPadding - topPadding, 0)
                self?.view.layoutIfNeeded()
            })
            .disposed(by: bag)
    }
    
    func setupSubcontrollers() {
        
        emailPasswordVc = EnrollmentEmailPasswordRouter.instantiateController()
        userInfosVc = EnrollmentUserInfosRouter.instantiateController()
        addressVc = EnrollmentEmailPasswordRouter.instantiateController()
        
        addChild(emailPasswordVc, inView: containerEmailPassword, withInsets: .zero)
        addChild(userInfosVc, inView: containerUserInfos, withInsets: .zero)
        addChild(addressVc, inView: containerAddress, withInsets: .zero)
    }
    
    func attachSubcontrollers() {
        buttonContinueBag = DisposeBag()
        
        guard let step = viewModel?.currentStep else { return }
        
        switch step {
        case .emailPassword:
            emailPasswordVc.validationIntent()
                .bind(to: buttonContinue.rx.isEnabled)
                .disposed(by: buttonContinueBag)
        case .userInfos:
            userInfosVc.validationIntent()
                .bind(to: buttonContinue.rx.isEnabled)
                .disposed(by: buttonContinueBag)
        case .address:
            addressVc.validationIntent()
                .bind(to: buttonContinue.rx.isEnabled)
                .disposed(by: buttonContinueBag)
        }
    }
    
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    func cancelIntent() -> Observable<EnrollmentViewModel.EnrollmentStep?> {
        return buttonClose.rx.tap.asObservable()
            .map { [weak self] _ in
                if let step = self?.viewModel?.currentStep {
                    return EnrollmentViewModel.EnrollmentStep(rawValue: step.rawValue - 1)
                }
                return nil
        }
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
        attachSubcontrollers()
        
        switch viewModel.currentStep {
        case .emailPassword:
            scrollViewContainer.scrollRectToVisible(containerEmailPassword.frame, animated: true)
        case .userInfos:
            scrollViewContainer.scrollRectToVisible(containerUserInfos.frame, animated: true)
        case .address:
            scrollViewContainer.scrollRectToVisible(containerAddress.frame, animated: true)
        }
        
        view.endEditing(true)
        
        if let title = buttonContinue.title(for: .normal),
            title != viewModel.buttonContinueTitle {
            buttonContinue.setTitle(viewModel.buttonContinueTitle, for: .normal)
        }
        buttonClose.setImage(UIImage(named: viewModel.imageNameButtonCancel), for: .normal)
        progressBar.setProgress(viewModel.progress, animated: true)
    }
    
}
