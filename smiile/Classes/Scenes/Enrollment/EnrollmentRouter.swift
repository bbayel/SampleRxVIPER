//
//  EnrollmentRouter.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit
import RxSwift

enum EnrollmentRoute {
    case cancel
    case home
}


/**
 * The EnrollmentRouterInput protocol declares an interface for EnrollmentRouter
 * Using an interface let you stub the component for Unit Testing
 */
protocol EnrollmentRouterInput {
    static func instantiateController() -> (EnrollmentController, PublishSubject<Void>)
    func go(to route : EnrollmentRoute)
}


struct EnrollmentRouter :  EnrollmentRouterInput {
    
    private weak var controller : EnrollmentController?
    let enrollmentSubject = PublishSubject<Void>()
    
    static func instantiateController() -> (EnrollmentController, PublishSubject<Void>) {
        let controller = EnrollmentController(nibName: "EnrollmentController", bundle: nil)
        
        let interactor = EnrollmentInteractor()
        let router = EnrollmentRouter(controller : controller)
        let presenter = EnrollmentPresenter(router: router, interactor: interactor, viewController: controller)
        controller.presenter = presenter
        
        return (controller, router.enrollmentSubject)
    }
    
    func go(to route : EnrollmentRoute) {
        switch route {
        case .cancel:
            controller?.dismiss(animated: true, completion: nil)
        case .home:
            controller?.dismiss(animated: true, completion: {
                self.enrollmentSubject.onNext(())
            })
        }
    }
    
    
}
