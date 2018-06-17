//
//  SearchController.swift
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

protocol SearchIntents : class, NotificationIntents {
    func loadIntent() -> Observable<Void>
    func searchIntent() -> Observable<String?>
    func display(viewModel : SearchViewModel)
}



class SearchController : BaseViewController, SearchIntents {
    
    var presenter : SearchModuleInterface!
    let searchSubjet = PublishSubject<String?>()
    let bag = DisposeBag()
    var viewModel: SearchViewModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBarContainer: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK:-  View LifeCycle
    deinit {
        print("Deinit \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach()
        setupView()
        title = "Recherche"
    }
    
    override func setupTabbar() {
        tabBarItem = UITabBarItem(title: "Recherche",
                                  image: UIImage(named:"icon_search"),
                                  tag: 3)
    }
    
    func setupView() {
        view.backgroundColor = .white
        searchBar.placeholder = "Rechercher un objet, un service..."
        searchBar.tintColor = .smiileBlue
        definesPresentationContext = true
        searchBar.barTintColor = .white
        
        if let textFieldInsideSearchBar:UITextField = searchBar.value(forKey: "searchField") as? UITextField {
            // Background color
            textFieldInsideSearchBar.backgroundColor = .background
            // Rounded corner
            textFieldInsideSearchBar.layer.cornerRadius = 10;
            textFieldInsideSearchBar.clipsToBounds = true;
        }
        
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.smiileBlue]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 60)
        }
        
        collectionView.register(SearchCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier())
        
        searchBar.rx.searchButtonClicked
            .map { [weak self] _ in
                return self?.searchBar.resignFirstResponder()
            }
            .map { [weak self] _ in self?.searchBar.text }
            .bind(to: searchSubjet)
            .disposed(by: bag)
    }
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    func searchIntent() -> Observable<String?> {
        return searchSubjet
    }
    
    //MARK:- Display
    func display(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
    
}

extension SearchController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.response?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier(), for: indexPath) as! SearchCollectionViewCell
        if let result = viewModel?.response?[indexPath.row] {
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
    
}

