//
//  RequestRouter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum RequestRoute {
    case mailbox
    case requestHelp
}


/**
 * The RequestRouterInput protocol declares an interface for RequestRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol RequestRouterInput {
    static func instantiateController() -> RequestController
    func go(to route : RequestRoute)
}


struct RequestRouter :  RequestRouterInput {
    
    private weak var controller : RequestController?
    
    static func instantiateController() -> RequestController {
        let controller = RequestController(nibName: "RequestController", bundle: nil)
        
        let interactor = RequestInteractor()
        let router = RequestRouter(controller : controller)
        let presenter = RequestPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : RequestRoute) {
        switch route {
        case .mailbox:
            let vc = MailboxRouter.instantiateController()
            controller?.navigationController?.pushViewController(vc, animated: true)
        case .requestHelp:
            let vc = RequestHelpRouter.instantiateController()
            controller?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
