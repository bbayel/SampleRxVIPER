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

protocol EnrollmentEmailPasswordIntents : class {
	func loadIntent() -> Observable<Void> 
    func display(viewModel : EnrollmentEmailPasswordViewModel)
}



class EnrollmentEmailPasswordController : UIViewController, EnrollmentEmailPasswordIntents {
    
    var presenter : EnrollmentEmailPasswordModuleInterface!
    
    
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

    //MARK:- Display
    func display(viewModel: EnrollmentEmailPasswordViewModel) {

    }
    
}
