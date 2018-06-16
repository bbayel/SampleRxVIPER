//
//  EnrollmentEmailPasswordRouter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum EnrollmentEmailPasswordRoute {
    
}


/**
 * The EnrollmentEmailPasswordRouterInput protocol declares an interface for EnrollmentEmailPasswordRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol EnrollmentEmailPasswordRouterInput {
    static func instantiateController() -> EnrollmentEmailPasswordController
    func go(to route : EnrollmentEmailPasswordRoute)
}


struct EnrollmentEmailPasswordRouter :  EnrollmentEmailPasswordRouterInput {
    
    private weak var controller : EnrollmentEmailPasswordController?
    
    static func instantiateController() -> EnrollmentEmailPasswordController {
        let controller = EnrollmentEmailPasswordController(nibName: "EnrollmentEmailPasswordController", bundle: nil)
        
        let interactor = EnrollmentEmailPasswordInteractor()
        let router = EnrollmentEmailPasswordRouter(controller : controller)
        let presenter = EnrollmentEmailPasswordPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : EnrollmentEmailPasswordRoute) {
//        switch route {
//
//        }
    }
    
    
}
