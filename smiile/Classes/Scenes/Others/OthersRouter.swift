//
//  OthersRouter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum OthersRoute {
    
}


/**
 * The OthersRouterInput protocol declares an interface for OthersRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol OthersRouterInput {
    static func instantiateController() -> OthersController
    func go(to route : OthersRoute)
}


struct OthersRouter :  OthersRouterInput {
    
    private weak var controller : OthersController?
    
    static func instantiateController() -> OthersController {
        let controller = OthersController(nibName: "OthersController", bundle: nil)
        
        let interactor = OthersInteractor()
        let router = OthersRouter(controller : controller)
        let presenter = OthersPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : OthersRoute) {
//        switch route {
//
//        }
    }
    
    
}
