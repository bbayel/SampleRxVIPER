//
//  LoginRouter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit
import RxSwift

enum LoginRoute {
    case enrollment
    case home
}


/**
 * The LoginRouterInput protocol declares an interface for LoginRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol LoginRouterInput {
    static func instantiateController() -> LoginController
    func go(to route : LoginRoute)
}


struct LoginRouter :  LoginRouterInput {
    
    private weak var controller : LoginController?
    let bag = DisposeBag()
    static func instantiateController() -> LoginController {
        let controller = LoginController(nibName: "LoginController", bundle: nil)
        
        let interactor = LoginInteractor()
        let router = LoginRouter(controller : controller)
        let presenter = LoginPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : LoginRoute) {
        switch route {
        case .enrollment:
            let (vc, enrollmentIntent) = EnrollmentRouter.instantiateController()
            controller?.present(vc, animated: true, completion: nil)
            enrollmentIntent.take(1)
                .subscribe(onNext: { self.go(to: .home) })
                .disposed(by: bag)
            
        case .home:
            let homeNavController = UINavigationController(rootViewController: HomeRouter.instantiateController())
            let requestNavController = UINavigationController(rootViewController: RequestRouter.instantiateController())
            let wantedNavController = UINavigationController(rootViewController: WantedRouter.instantiateController())
            let searchNavController = UINavigationController(rootViewController: SearchRouter.instantiateController())
            let othersNavController = UINavigationController(rootViewController: OthersRouter.instantiateController())
            let rootController = RootViewController(nibName: "RootViewController", bundle: nil)
            rootController.viewControllers = [homeNavController, requestNavController, wantedNavController, searchNavController, othersNavController]
            controller?.present(rootController, animated: true, completion: nil)
        }
    }
    
    
}
