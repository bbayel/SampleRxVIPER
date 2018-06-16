//
//  EnrollmentUserInfosRouter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum EnrollmentUserInfosRoute {
    
}


/**
 * The EnrollmentUserInfosRouterInput protocol declares an interface for EnrollmentUserInfosRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol EnrollmentUserInfosRouterInput {
    static func instantiateController() -> EnrollmentUserInfosController
    func go(to route : EnrollmentUserInfosRoute)
}


struct EnrollmentUserInfosRouter :  EnrollmentUserInfosRouterInput {
    
    private weak var controller : EnrollmentUserInfosController?
    
    static func instantiateController() -> EnrollmentUserInfosController {
        let controller = EnrollmentUserInfosController(nibName: "EnrollmentUserInfosController", bundle: nil)
        
        let interactor = EnrollmentUserInfosInteractor()
        let router = EnrollmentUserInfosRouter(controller : controller)
        let presenter = EnrollmentUserInfosPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : EnrollmentUserInfosRoute) {
//        switch route {
//
//        }
    }
    
    
}
