//
//  EnrollmentAddressRouter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum EnrollmentAddressRoute {
    
}


/**
 * The EnrollmentAddressRouterInput protocol declares an interface for EnrollmentAddressRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol EnrollmentAddressRouterInput {
    static func instantiateController() -> EnrollmentAddressController
    func go(to route : EnrollmentAddressRoute)
}


struct EnrollmentAddressRouter :  EnrollmentAddressRouterInput {
    
    private weak var controller : EnrollmentAddressController?
    
    static func instantiateController() -> EnrollmentAddressController {
        let controller = EnrollmentAddressController(nibName: "EnrollmentAddressController", bundle: nil)
        
        let interactor = EnrollmentAddressInteractor()
        let router = EnrollmentAddressRouter(controller : controller)
        let presenter = EnrollmentAddressPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : EnrollmentAddressRoute) {
//        switch route {
//
//        }
    }
    
    
}
