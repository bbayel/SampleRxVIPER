//
//  HomeRouter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum HomeRoute {
    case mailbox
}


/**
 * The HomeRouterInput protocol declares an interface for HomeRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol HomeRouterInput {
    static func instantiateController() -> HomeController
    func go(to route : HomeRoute)
}


struct HomeRouter :  HomeRouterInput {
    
    private weak var controller : HomeController?
    
    static func instantiateController() -> HomeController {
        let controller = HomeController(nibName: "HomeController", bundle: nil)
        
        let interactor = HomeInteractor()
        let router = HomeRouter(controller : controller)
        let presenter = HomePresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : HomeRoute) {
        switch route {
        case .mailbox:
            let vc = MailboxRouter.instantiateController()
            controller?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
