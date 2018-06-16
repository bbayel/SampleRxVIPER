//
//  EnrollmentSuccessController.swift
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

protocol EnrollmentSuccessIntents : class {
	func loadIntent() -> Observable<Void> 
    func display(viewModel : EnrollmentSuccessViewModel)
}



class EnrollmentSuccessController : UIViewController, EnrollmentSuccessIntents {
    
    var presenter : EnrollmentSuccessModuleInterface!
    
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        
    }
    

    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }
    
    func validationIntent() -> Observable<Bool> {
        return .just(true)
    }

    //MARK:- Display
    func display(viewModel: EnrollmentSuccessViewModel) {

    }
    
}
