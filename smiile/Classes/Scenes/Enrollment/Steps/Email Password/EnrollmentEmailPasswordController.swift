//
//  EnrollmentEmailPasswordController.swift
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

protocol EnrollmentEmailPasswordIntents : class {
	func loadIntent() -> Observable<Void>
    func validationIntent() -> Observable<Bool>
    func display(viewModel : EnrollmentEmailPasswordViewModel)
}



class EnrollmentEmailPasswordController : UIViewController, EnrollmentEmailPasswordIntents {
    
    var presenter : EnrollmentEmailPasswordModuleInterface!
    
    @IBOutlet weak var labelExplaination: Label!
    @IBOutlet weak var tfMail: TextField!
    @IBOutlet weak var tfPassword: TextField!
    
    let bag = DisposeBag()
    
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
        let emailObs = tfMail.rx.text.asObservable()
            .map { text -> Bool in
                if let text = text,
                    text.count >= 5,
                    text.contains("@") {
                    return true
                }
                return false
        }
        
        let passwordObs = tfPassword.rx.text.asObservable()
            .map { text -> Bool in
                if let text = text,
                    text.count >= 5 {
                    return true
                }
                return false
        }
        
       return Observable.combineLatest(emailObs, passwordObs)
            .map { ($0 && $1) }
    }

    //MARK:- Display
    func display(viewModel: EnrollmentEmailPasswordViewModel) {

    }
    
}

extension EnrollmentEmailPasswordController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == tfMail {
            _ = tfPassword.becomeFirstResponder()
        }
        else {
            _ = tfPassword.resignFirstResponder()
        }
        
        return false
    }
    
}
