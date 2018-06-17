//
//  LoginController.swift
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

protocol LoginIntents : class {
    func loadIntent() -> Observable<Void>
    func registerIntent() -> Observable<Void>
    func loginIntent() -> Observable<Void>
    func display(viewModel : LoginViewModel)
}



class LoginController : UIViewController, LoginIntents {
    
    var presenter : LoginModuleInterface!
    let bag = DisposeBag()
    
    @IBOutlet weak var bottomButtonRegister: NSLayoutConstraint!
    @IBOutlet weak var heightButtonRegister: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tfMail: TextField!
    @IBOutlet weak var tfPassword: TextField!
    @IBOutlet weak var buttonLogin: Button!
    @IBOutlet weak var buttonFacebook: Button!
    @IBOutlet weak var buttonRegister: Button!
    
    
    //MARK:-  View LifeCycle
    deinit {
        print("Deinit \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        observeKeyboard()
        observeTextfields()
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
                if keyboardVisibleHeight > 0 {
                    self?.bottomButtonRegister.constant = -50
                }
                else {
                    self?.bottomButtonRegister.constant = 0
                }
                self?.bottomConstraint.constant = max(keyboardVisibleHeight - bottomPadding - topPadding, 0)
                self?.view.layoutIfNeeded()
            })
            .disposed(by: bag)
    }
    
    func observeTextfields() {
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
        
        Observable.combineLatest(emailObs, passwordObs)
            .map { ($0 && $1) }
            .bind(to: buttonLogin.rx.isEnabled)
            .disposed(by: bag)
    }
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    func loginIntent() -> Observable<Void> {
        return Observable.merge([buttonLogin.rx.tap.asObservable(),
                                 buttonFacebook.rx.tap.asObservable()])
    }
    
    func registerIntent() -> Observable<Void> {
        return buttonRegister.rx.tap.asObservable()
    }
    
    //MARK:- Display
    func display(viewModel: LoginViewModel) {
        
    }
    
}

extension LoginController : UITextFieldDelegate {
    
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
