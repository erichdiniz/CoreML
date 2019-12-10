//
//  RegisterService.swift
//  Core ML
//
//  Created by Erich Diniz on 31/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class RegisterService{

    func registerPost(email: String, pass: String, completion: @escaping (_ req: [Register]?, _ errorMessage: String?) -> Void){
        
//        let reg = RegisterViewController()
//        let email = reg.txtRegisterEmail.text!
//        let pass = reg.txtRegisterPassword.text!
        
        let param: Parameters = ["email": email, "password": pass]
        Alamofire.request("https://localhost:4200/users", method: .post, parameters: param).responseJSON { response in
           
            if let json = response.result.value {
                
                completion(json as? [Register], nil)
                print("JSON: \(json)") // serialized json response
            }
        
        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            print("Data: \(utf8Text)") // original server data as UTF8 string
            
            }
        }
    }
}
