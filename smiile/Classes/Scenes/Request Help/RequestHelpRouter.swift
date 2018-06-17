//
//  RequestHelpRouter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum RequestHelpRoute {
    case back
}


/**
 * The RequestHelpRouterInput protocol declares an interface for RequestHelpRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol RequestHelpRouterInput {
    static func instantiateController() -> RequestHelpController
    func go(to route : RequestHelpRoute)
}


struct RequestHelpRouter :  RequestHelpRouterInput {
    
    private weak var controller : RequestHelpController?
    
    static func instantiateController() -> RequestHelpController {
        let controller = RequestHelpController(nibName: "RequestHelpController", bundle: nil)
        
        let interactor = RequestHelpInteractor()
        let router = RequestHelpRouter(controller : controller)
        let presenter = RequestHelpPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : RequestHelpRoute) {
        switch route {
        case .back:
            controller?.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
