//
//  OthersController.swift
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

protocol OthersIntents : class, NotificationIntents {
	func loadIntent() -> Observable<Void> 
    func display(viewModel : OthersViewModel)
}



class OthersController : BaseViewController, OthersIntents {
    
    var presenter : OthersModuleInterface!
    
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        title = "Autres"
    }
    
    override func setupTabbar() {
        tabBarItem = UITabBarItem(title: "Autres",
                                  image: UIImage(named:"icon_others"),
                                  tag: 4)
    }
    

    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }

    //MARK:- Display
    func display(viewModel: OthersViewModel) {

    }
    
}
