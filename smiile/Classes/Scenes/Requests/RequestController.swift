//
//  RequestController.swift
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

protocol RequestIntents : class, NotificationIntents {
	func loadIntent() -> Observable<Void>
    func requestHelpIntent() -> Observable<Void>
    func display(viewModel : RequestViewModel)
}



class RequestController : BaseViewController, RequestIntents {
    
    var presenter : RequestModuleInterface!
    @IBOutlet weak var buttonRequestHelp: Button!
    
    //MARK:-  View LifeCycle
        deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        title = "Mes demandes"
    }

    override func setupTabbar() {
        tabBarItem = UITabBarItem(title: "Mes demandes",
                                  image: UIImage(named:"icon_request"),
                                  tag: 1)
    }

    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
    	return Observable.just(())
    }
    
    func requestHelpIntent() -> Observable<Void> {
        return buttonRequestHelp.rx.tap.asObservable()
    }

    //MARK:- Display
    func display(viewModel: RequestViewModel) {

    }
    
}
