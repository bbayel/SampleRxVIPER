//
//  EnrollmentUserInfosController.swift
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

protocol EnrollmentUserInfosIntents : class {
	func loadIntent() -> Observable<Void>
    func validationIntent() -> Observable<Bool>
    func display(viewModel : EnrollmentUserInfosViewModel)
}



class EnrollmentUserInfosController : UIViewController, EnrollmentUserInfosIntents {
    
    var presenter : EnrollmentUserInfosModuleInterface!
    let bag = DisposeBag()
    
    @IBOutlet weak var labelExplaination: Label!
    @IBOutlet weak var tfFirstName: TextField!
    @IBOutlet weak var tfLastName: TextField!
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        observeKeyboard()
    }
    
    func observeKeyboard() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [weak self] keyboardVisibleHeight in
                if keyboardVisibleHeight > 0 {
                    self?.labelExplaination.alpha = 0.0
                    if self?.labelExplaination.isHidden == false {
                        self?.labelExplaination.isHidden = true
                    }
                }
                else {
                    self?.labelExplaination.alpha = 1.0
                    if self?.labelExplaination.isHidden == true {
                        self?.labelExplaination.isHidden = false
                    }
                }
                self?.view.layoutIfNeeded()
            })
            .disposed(by: bag)
    }
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }
    
    func validationIntent() -> Observable<Bool> {
        let firstNameObs = tfFirstName.rx.text.asObservable()
            .map { text -> Bool in
                if let text = text,
                    text.count >= 1 {
                    return true
                }
                return false
        }
        
        let lastNameObs = tfLastName.rx.text.asObservable()
            .map { text -> Bool in
                if let text = text,
                    text.count >= 1 {
                    return true
                }
                return false
        }
        
        return Observable.combineLatest(firstNameObs, lastNameObs)
            .map { ($0 && $1) }
    }

    //MARK:- Display
    func display(viewModel: EnrollmentUserInfosViewModel) {

    }
    
}
