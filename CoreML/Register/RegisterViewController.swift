//
//  RegisterViewController.swift
//  Core ML
//
//  Created by Erich Diniz on 31/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    let viewModel = RegisterViewModel()
    @IBOutlet weak var btBack: UIBarButtonItem!
    @IBOutlet weak var txtRegisterEmail: UITextField!
    @IBOutlet weak var txtRegisterPassword: UITextField!
    
    
    @IBAction func actionBack(_ sender: Any) {
        viewModel.dataRegister(email: txtRegisterEmail.text!, pass: txtRegisterPassword.text!)

        self.dismiss(animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
