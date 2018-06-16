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

enum LoginRoute {
    
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
    
    static func instantiateController() -> LoginController {
        let controller = LoginController(nibName: "LoginController", bundle: nil)
        
        let interactor = LoginInteractor()
        let router = LoginRouter(controller : controller)
        let presenter = LoginPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : LoginRoute) {
//        switch route {
//
//        }
    }
    
    
}
