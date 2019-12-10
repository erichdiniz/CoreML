     //
//  LoginViewController.swift
//  Core ML
//
//  Created by Erich Diniz on 30/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController{
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var lblValidation: UILabel!
    @IBOutlet weak var btRegister: UIButton!
    let model = LoginModel()
    let disposeBag = DisposeBag()
    let viewModel = RegisterViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        _ = txtEmail.rx.text.map { $0 ?? "" }.bind(to: model.emailText)
        _ = txtPassword.rx.text.map {$0 ?? ""}.bind(to: model.passText)
        _ = model.isValid.bind(to: btLogin.rx.isEnabled)
        
        model.isValid.subscribe(onNext: { [unowned self] isValid in
            self.lblValidation.text = isValid ? "Valid" : "Invalid"
            self.lblValidation.textColor = isValid ? .green : .red


//            self.btLogin.titleLabel?.adjustsFontSizeToFitWidth = true

            
        }).disposed(by: disposeBag)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 200
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}
