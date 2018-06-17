//
//  SearchRouter.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit

enum SearchRoute {
    
}


/**
 * The SearchRouterInput protocol declares an interface for SearchRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol SearchRouterInput {
    static func instantiateController() -> SearchController
    func go(to route : SearchRoute)
}


struct SearchRouter :  SearchRouterInput {
    
    private weak var controller : SearchController?
    
    static func instantiateController() -> SearchController {
        let controller = SearchController(nibName: "SearchController", bundle: nil)
        
        let interactor = SearchInteractor()
        let router = SearchRouter(controller : controller)
        let presenter = SearchPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return controller
    }
    
    func go(to route : SearchRoute) {
//        switch route {
//
//        }
    }
    
    
}
