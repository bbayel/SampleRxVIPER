//
//  WantedController.swift
//  smiile
//
//  Created by Benjamin on 17/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol WantedIntents : class, NotificationIntents {
    func loadIntent() -> Observable<Void> 
    func display(viewModel : WantedViewModel)
}



class WantedController : BaseViewController, WantedIntents {
    
    var presenter : WantedModuleInterface!
    var viewModel: WantedViewModel?
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:-  View LifeCycle
    deinit {
        print("Deinit \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        title = "Annonces"
        
        collectionView.register(AdCollectionViewCell.nib(), forCellWithReuseIdentifier: AdCollectionViewCell.reuseIdentifier())
        collectionView.register(HeaderWantedCollectionReusableView.nib(),
                                forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                withReuseIdentifier: HeaderWantedCollectionReusableView.reuseIdentifier())
    }
    
    override func setupTabbar() {
        tabBarItem = UITabBarItem(title: "Annonces",
                                  image: UIImage(named:"icon_wanted"),
                                  tag: 2)
    }
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    //MARK:- Display
    func display(viewModel: WantedViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
    
}

extension WantedController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.smallAds?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.reuseIdentifier(), for: indexPath) as! AdCollectionViewCell
        if let result = viewModel?.smallAds?[indexPath.row] {
            cell.setup(result)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderWantedCollectionReusableView.reuseIdentifier(), for: indexPath)
        return view
    }
    
}
