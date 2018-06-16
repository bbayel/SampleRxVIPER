//
//  UIViewControllerExtension.swift
//  
//
//  Created by Benjamin Bayel on 14/11/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChild(_ childController: UIViewController, inView view: UIView, withInsets insets: UIEdgeInsets) {
        addChild(childController, inView: view, withInsets: insets, animated: true)
    }
    
    func addChild(_ childController: UIViewController, inView view: UIView, withInsets insets: UIEdgeInsets, animated: Bool) {
        addChildViewController(childController)
        childController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childController.view)
        pin(view: childController.view, inView: view, withInsets: insets)
        childController.willMove(toParentViewController: self)
        childController.didMove(toParentViewController: self)
        
        if animated {
            childController.view.alpha = 0.0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveLinear], animations: {
                childController.view.alpha = 1.0

            }, completion: nil)
        }
    }
    
    func removeChildController() {
        removeChildController(true)
    }
    
    func removeChildController(_ animated: Bool) {
        
        if animated {
            view.alpha = 1.0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut], animations: { [weak self] in
                self?.view.alpha = 0.0
            }, completion: { [weak self] isFinished in
                self?.completeRemoveChildController()
            })
        }
        else {
            completeRemoveChildController()
        }
        
    }
    
    private func completeRemoveChildController() {
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
    
    func pin(view: UIView, inView: UIView, withInsets insets:UIEdgeInsets) {

        let viewsDict:[String:UIView] = ["childView":view]
        var metrics:[String:Any] = [:]
        metrics["topSpace"] = insets.top
        metrics["bottomSpace"] = insets.bottom
        metrics["leftSpace"] = insets.left
        metrics["rightSpace"] = insets.right
        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topSpace)-[childView]-(bottomSpace)-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewsDict))
        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(leftSpace)-[childView]-(rightSpace)-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewsDict))
    }
    
}

