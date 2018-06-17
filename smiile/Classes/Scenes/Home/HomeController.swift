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

protocol HomeIntents : class, NotificationIntents {
	func loadIntent() -> Observable<Void>
    func requestHelpIntent() -> Observable<Void>
    func display(viewModel : HomeViewModel)
}



class HomeController : BaseViewController, HomeIntents {
    
    var presenter : HomeModuleInterface!
    @IBOutlet weak var buttonRequestHelp: Button!

    
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
    
    func requestHelpIntent() -> Observable<Void> {
        return buttonRequestHelp.rx.tap.asObservable()
    }

    //MARK:- Display
    func display(viewModel: HomeViewModel) {

    }
    
}
