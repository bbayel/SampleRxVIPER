//
//  RequestHelpController.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxKeyboard

protocol RequestHelpIntents : class {
    func loadIntent() -> Observable<Void>
    func publishIntent() -> Observable<Void>
    func display(viewModel : RequestHelpViewModel)
    func displaySuccessAlert() -> Observable<Void>
}



class RequestHelpController : UIViewController, RequestHelpIntents {
    
    var presenter : RequestHelpModuleInterface!
    let bag = DisposeBag()
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tfRequest: TextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var buttonPublish: Button!
    @IBOutlet weak var labelPrice: Label!
    
    //MARK:-  View LifeCycle
    deinit {
        print("Deinit \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        title = "Ma demande"
        
        observeKeyboard()
        observeTextfields()
        observaSlider()
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
                let tabBarHeight = self?.tabBarController?.tabBar.bounds.height ?? 0
                self?.bottomConstraint.constant = max(keyboardVisibleHeight - bottomPadding - topPadding - tabBarHeight, 0)
                self?.view.layoutIfNeeded()
            })
            .disposed(by: bag)
    }
    
    func observaSlider() {
        
        slider.rx.controlEvent(.valueChanged)
            .map { [weak self] _ -> String in
                if let value = self?.slider.value {
                    return "\(Int(value)) €"
                }
                return "Bénévolement"
            }
            .bind(to: labelPrice.rx.text)
            .disposed(by: bag)
    }
    
    func observeTextfields() {
        tfRequest.rx.text.asObservable()
            .map { text -> Bool in
                if let text = text,
                    text.count >= 1 {
                    return true
                }
                return false
            }
            .bind(to: buttonPublish.rx.isEnabled)
            .disposed(by: bag)
    }
    
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    func publishIntent() -> Observable<Void> {
        return buttonPublish.rx.tap.asObservable()
    }
    
    //MARK:- Display
    func display(viewModel: RequestHelpViewModel) {
        
    }
    
    func displaySuccessAlert() -> Observable<Void> {
        view.endEditing(true)
        let successSubject = PublishSubject<Void>()
        let alert = UIAlertController(title: "Félicitations !",
                                      message: "Votre demande va bientôt être publiée, vous recevrez un e-mail de confirmation lorsqu'elle paraitra en ligne",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Fermer",
                                     style: .default) { _ in
                                        successSubject.onNext(())
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        return successSubject
    }
    
}
