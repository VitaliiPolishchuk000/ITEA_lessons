//
//  SignInVC.swift
//  HomeWork 11.2
//
//  Created by Vitalii on 06.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth

class SignInVC: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    // Keyboard dismiss
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }

    @objc func didTapLoginButton() {
        AuthManager.shared.login(email: loginTextField.text, password: passwordTextField.text) { (result) in
            switch result {
            case .success(_):
                self.showAlert(title: kAlertTitleSuccess, message: kAlertMessageAuthSuccess) {
                    
                    // UserDefaults
                    if let userId = Auth.auth().currentUser?.uid {
                        UserDefaults.standard.set(userId, forKey: kCurrentUserKey)
                    }
                    self.performSegue(withIdentifier: "logInSegue", sender: nil)
                }
            case .failure(let error):
                self.showAlert(title: kAlertTitleError, message: error.localizedDescription)
            }
        }
    }
    
    @IBAction func signInAction(_ sender: Any) {
        didTapLoginButton()
    }

}


extension SignInVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField: passwordTextField.becomeFirstResponder()
        default: textField.resignFirstResponder()
        }
        return true
    }
}


