//
//  LoginMOdel.swift
//  Core ML
//
//  Created by Erich Diniz on 30/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import Foundation
import RxSwift

struct LoginModel{
    var emailText = BehaviorSubject<String>(value: "")
    var passText = BehaviorSubject<String>(value: "")
    
    var isValid: Observable<Bool>{
        return Observable.combineLatest(emailText.asObservable(), passText.asObservable()){
            email, password in email.count >= 6 && password.count >= 6
        }
    }
}
