//
//  SignUpVC.swift
//  HomeWork9
//
//  Created by Vitalii on 22.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//
import Firebase
import UIKit

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
        var message: String = ""
        if isValidInputEmail(userEmail: emailRegTextField.text) && isValidPass(userPassword: passwordRegTextField.text, userPasswordConfirm: passwordConfRegTextField.text) {
            let signUpManager = FirebaseAuthManager()
            if let email = emailRegTextField.text, let password = passwordRegTextField.text {
                signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                    guard let `self` = self else { return }
                    if (success) {
                        message = "User was sucessfully created."
                    } else {
                        message = "There was an error."
                    }
                    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
                    
                    alertController.setValue(self.alertFontSize(message: message), forKey: "attributedMessage")
                    
                    let action = UIAlertAction(title: "OK", style: .cancel) { _ in
                        self.dismiss(animated: true)
                    }
                    alertController.addAction(action)
                    alertController.view.tintColor = UIColor.blue
                    self.display(alertController: alertController)
                }
            }
            
        } else if isValidPass(userPassword: passwordRegTextField.text, userPasswordConfirm: passwordConfRegTextField.text) {
            
            message = "Uncorrect email"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.display(alertController: alertController)
            
        } else if isValidInputEmail(userEmail: emailRegTextField.text) {
            
            message = "write correct password"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.display(alertController: alertController)
            
        } else {
            message = "Uncorrect email"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.display(alertController: alertController)
            
        }
        
    }
    
    func display(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertFontSize(message: String) -> NSMutableAttributedString {
        let messageFont = [kCTFontAttributeName: UIFont(name: "Avenir-Roman", size: 30.0)!]
        let messageAttrString = NSMutableAttributedString(string: message, attributes: messageFont as [NSAttributedString.Key : Any])
        return messageAttrString
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
