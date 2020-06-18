//
//  SignUpVC.swift
//  HomeWork 11.2
//
//  Created by Vitalii on 06.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit
import Foundation

class SignUpVC: UIViewController {

    @IBOutlet weak var emailRegTextField: UITextField!
    @IBOutlet weak var passwordRegTextField: UITextField!
    @IBOutlet weak var passwordConfRegTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailRegTextField.delegate = self
        passwordRegTextField.delegate = self
        passwordConfRegTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func didTapSignUpButton() {
        
        AuthManager.shared.register(email: emailRegTextField.text, password: passwordRegTextField.text, confirmPassword: passwordConfRegTextField.text) { (result) in
            switch result {
                
            case .success(let user):
                self.showAlert(title: kAlertTitleSuccess, message: kAlertMessageRegistrationSuccess) {
                    let vc = self.storyboard?.instantiateViewController(identifier: "UserProfileViewController") as! UserProfileViewController
                    vc.modalTransitionStyle = .flipHorizontal
                    vc.modalPresentationStyle = .fullScreen
                    vc.currentUser = user
                    self.present(vc, animated: true)
                }
                
            case .failure(let error):
                self.showAlert(title: kAlertTitleError, message: error.localizedDescription)
            }
        }
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
        didTapSignUpButton()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension SignUpVC: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailRegTextField: passwordRegTextField.becomeFirstResponder()
        case passwordRegTextField: passwordConfRegTextField.becomeFirstResponder()
        default: textField.resignFirstResponder()
        }
        return true
    }
}
