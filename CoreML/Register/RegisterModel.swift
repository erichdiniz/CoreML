//
//  RegisterModel.swift
//  Core ML
//
//  Created by Erich Diniz on 31/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import Foundation
import RxSwift

struct Register{
    var email = BehaviorSubject<String>(value: "")
    var pass = BehaviorSubject<String>(value: "")


    var isValid: Observable<Bool>{
        return Observable.combineLatest(email.asObservable(), pass.asObservable()){
            email, password in email.count >= 6 && password.count >= 6
        }
    }
}
