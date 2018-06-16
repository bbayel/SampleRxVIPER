//
//  EnrollmentSuccessRouter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum EnrollmentSuccessRoute {
    
}


/**
 * The EnrollmentSuccessRouterInput protocol declares an interface for EnrollmentSuccessRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol EnrollmentSuccessRouterInput {
    static func instantiateController() -> EnrollmentSuccessController
    func go(to route : EnrollmentSuccessRoute)
}


struct EnrollmentSuccessRouter :  EnrollmentSuccessRouterInput {
    
    private weak var controller : EnrollmentSuccessController?
    
    static func instantiateController() -> EnrollmentSuccessController {
        let controller = EnrollmentSuccessController(nibName: "EnrollmentSuccessController", bundle: nil)
        
        let interactor = EnrollmentSuccessInteractor()
        let router = EnrollmentSuccessRouter(controller : controller)
        let presenter = EnrollmentSuccessPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : EnrollmentSuccessRoute) {
//        switch route {
//
//        }
    }
    
    
}
