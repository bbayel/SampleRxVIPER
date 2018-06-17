//
//  EnrollmentAddressInteractor.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright (c) 2018 bbayel. All rights reserved.
//
//


import Foundation
import RxSwift

protocol  EnrollmentAddressInteractorInput  {
    func addressAutocomplete( _ input: String?) -> Observable<[String]>
}

struct EnrollmentAddressInteractor : EnrollmentAddressInteractorInput {

    let repository = AddressRepository()
    
    func addressAutocomplete(_ input: String?) -> Observable<[String]> {
        return repository.searchAddress(input)
    }

}
