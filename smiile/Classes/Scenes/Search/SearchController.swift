//
//  SearchController.swift
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

protocol SearchIntents : class {
	func loadIntent() -> Observable<Void> 
    func display(viewModel : SearchViewModel)
}



class SearchController : BaseViewController, SearchIntents {
    
    var presenter : SearchModuleInterface!
    
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        tabBarItem = UITabBarItem(title: "Recherche",
                                  image: UIImage(named:"icon_search"),
                                  tag: 0)

    }
    

    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }

    //MARK:- Display
    func display(viewModel: SearchViewModel) {

    }
    
}
