//
//  HomeController.swift
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

protocol HomeIntents : class {
	func loadIntent() -> Observable<Void> 
    func display(viewModel : HomeViewModel)
}



class HomeController : BaseViewController, HomeIntents {
    
    var presenter : HomeModuleInterface!
    
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Accueil"
        presenter.attach()
    }
    
    override func setupTabbar() {
        tabBarItem = UITabBarItem(title: "Accueil",
                                  image: UIImage(named:"icon_home"),
                                  tag: 0)
    }    

    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }

    //MARK:- Display
    func display(viewModel: HomeViewModel) {

    }
    
}
