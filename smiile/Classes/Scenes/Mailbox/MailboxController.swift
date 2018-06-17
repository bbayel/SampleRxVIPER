//
//  MailboxController.swift
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

protocol MailboxIntents : class {
	func loadIntent() -> Observable<Void> 
    func display(viewModel : MailboxViewModel)
}



class MailboxController : UIViewController, MailboxIntents {
    
    var presenter : MailboxModuleInterface!
    
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        title = "Ma messagerie"
    }
    

    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }

    //MARK:- Display
    func display(viewModel: MailboxViewModel) {

    }
    
}
