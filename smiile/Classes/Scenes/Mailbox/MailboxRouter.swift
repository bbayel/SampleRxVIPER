//
//  MailboxRouter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum MailboxRoute {
    
}


/**
 * The MailboxRouterInput protocol declares an interface for MailboxRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol MailboxRouterInput {
    static func instantiateController() -> MailboxController
    func go(to route : MailboxRoute)
}


struct MailboxRouter :  MailboxRouterInput {
    
    private weak var controller : MailboxController?
    
    static func instantiateController() -> MailboxController {
        let controller = MailboxController(nibName: "MailboxController", bundle: nil)
        
        let interactor = MailboxInteractor()
        let router = MailboxRouter(controller : controller)
        let presenter = MailboxPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : MailboxRoute) {
//        switch route {
//
//        }
    }
    
    
}
