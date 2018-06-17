//
//  WantedRouter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum WantedRoute {
    case mailbox
}


/**
 * The WantedRouterInput protocol declares an interface for WantedRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol WantedRouterInput {
    static func instantiateController() -> WantedController
    func go(to route : WantedRoute)
}


struct WantedRouter :  WantedRouterInput {
    
    private weak var controller : WantedController?
    
    static func instantiateController() -> WantedController {
        let controller = WantedController(nibName: "WantedController", bundle: nil)
        
        let interactor = WantedInteractor()
        let router = WantedRouter(controller : controller)
        let presenter = WantedPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : WantedRoute) {
        switch route {
        case .mailbox:
            let vc = MailboxRouter.instantiateController()
            controller?.navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    
}
