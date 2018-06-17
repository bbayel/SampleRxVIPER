//
//  BaseViewController.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import UIKit
import RxSwift

protocol NotificationIntents {
    func notificationIntent() -> Observable<Void>
}

extension NotificationIntents where Self: BaseViewController {
    
    func notificationIntent() -> Observable<Void> {
        return notificationBarButton.badgeButton.rx.tap.asObservable()
    }
}

class BaseViewController : UIViewController {

    let notificationBarButton = BadgeBarButtonItem(image: UIImage(named: "icon_notification")!, badgeText: nil, target: nil, action: nil)

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabbar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTabbar()  {}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .smiileBlue
        navigationController?.navigationBar.prefersLargeTitles = true
        
        notificationBarButton.badgeText = "5"
        
        navigationItem.setRightBarButton(notificationBarButton, animated: false)
    }

}
