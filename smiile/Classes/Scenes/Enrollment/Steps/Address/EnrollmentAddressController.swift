//
//  EnrollmentAddressController.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol EnrollmentAddressIntents : class {
    func loadIntent() -> Observable<Void>
    func selectionIntent() -> Observable<String?>
    func textIntent() -> Observable<String?>
    func validationIntent() -> Observable<Bool>
    func display(viewModel : EnrollmentAddressViewModel)
}



class EnrollmentAddressController : UIViewController, EnrollmentAddressIntents {
    
    var presenter : EnrollmentAddressModuleInterface!
    var viewModel: EnrollmentAddressViewModel?
    let bag = DisposeBag()
    let selectionSubject = PublishSubject<String?>()
    let validateRelay = BehaviorRelay<String?>(value: nil)
    @IBOutlet weak var tfAddress: TextField!
    @IBOutlet weak var tableViewResults: UITableView!
    
    //MARK:-  View LifeCycle
    deinit {
        print("Deinit \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewResults.register(AddressTableViewCell.nib(), forCellReuseIdentifier: AddressTableViewCell.reuseIdentifier())
        presenter.attach()
        observeTextfield()
    }
    
    func observeTextfield() {
        Observable.combineLatest(tfAddress.rx.text.asObservable(), validateRelay)
            .map { (text, value) -> Bool in
                if let text = text, text.count > 0 {
                    if value == nil {
                        return false
                    }
                }
                return true
            }
            .bind(to: tableViewResults.rx.isHidden)
            .disposed(by: bag)
        
        tfAddress.rx.controlEvent(UIControlEvents.editingDidBegin)
            .subscribe(onNext: { [weak self] _ in
                self?.selectionSubject.onNext(nil)
            })
            .disposed(by: bag)
    }
    
    //MARK:- RxIntents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    func selectionIntent() -> Observable<String?> {
        return selectionSubject
    }
    
    func textIntent() -> Observable<String?> {
        return tfAddress.rx.text.asObservable()
    }
    
    func validationIntent() -> Observable<Bool> {
        return validateRelay.map { value in
            return value != nil
        }
    }
    
    //MARK:- Display
    func display(viewModel: EnrollmentAddressViewModel) {
        self.viewModel = viewModel
        validateRelay.accept(viewModel.selectedAddress)
        if let selection = viewModel.selectedAddress {
            tfAddress.text = selection
        }
        tableViewResults.reloadData()
    }
    
}

extension EnrollmentAddressController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.autocompleteResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.reuseIdentifier(), for: indexPath) as! AddressTableViewCell
        if let address = viewModel?.autocompleteResponse?[indexPath.row] {
            cell.setup(address)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view.endEditing(true)
        if let address = viewModel?.autocompleteResponse?[indexPath.row] {
            selectionSubject.onNext(address)
        }
    }
    
    
}
