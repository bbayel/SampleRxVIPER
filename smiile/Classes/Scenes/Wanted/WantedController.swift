//
//  WantedController.swift
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

protocol WantedIntents : class {
	func loadIntent() -> Observable<Void> 
    func display(viewModel : WantedViewModel)
}



class WantedController : BaseViewController, WantedIntents {
    
    var presenter : WantedModuleInterface!
    
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
    }
    
    override func setupTabbar() {
        tabBarItem = UITabBarItem(title: "Annonces",
                                  image: UIImage(named:"icon_wanted"),
                                  tag: 2)
    }

    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }

    //MARK:- Display
    func display(viewModel: WantedViewModel) {

    }
    
}
