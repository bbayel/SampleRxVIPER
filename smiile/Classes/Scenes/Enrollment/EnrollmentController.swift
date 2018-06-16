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
    func cancelIntent() -> Observable<Void>
    func display(viewModel : EnrollmentViewModel)
}



class EnrollmentController : UIViewController, EnrollmentIntents {
    
    var presenter : EnrollmentModuleInterface!
    
    @IBOutlet weak var buttonClose: Button!
    
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
    
    func cancelIntent() -> Observable<Void> {
        return buttonClose.rx.tap.asObservable()
    }

    //MARK:- Display
    func display(viewModel: EnrollmentViewModel) {

    }
    
}
