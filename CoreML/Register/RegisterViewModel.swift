////  RegisterViewModel.swift
//  Core ML
//
//  Created by Erich Diniz on 31/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import Foundation
import UIKit
//import Alamofire
import RxSwift

class RegisterViewModel{
    
    
    let service = RegisterService()

    func dataRegister(email: String, pass: String){
        service.registerPost(email: email, pass: pass, completion: {
            req, errorMessage in
            
        })
    }

    func fetchUser(){
      
    }
}
