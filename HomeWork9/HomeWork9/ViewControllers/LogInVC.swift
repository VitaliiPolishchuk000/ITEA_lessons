//
//  LogInVC.swift
//  HomeWork9
//
//  Created by Vitalii on 22.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth
import UIKit

class LogInVC: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.performSegue(withIdentifier: "logInSegue", sender: nil)

        let defaults = UserDefaults.standard
        if defaults.string(forKey: "isAuthorizedKey") == "true" {

            self.performSegue(withIdentifier: "logInSegue", sender: nil)

        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    func isValidInputEmail () -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPredicate.evaluate(with: loginTextField.text)
//    }
//
//    func isValidPass() -> Bool {
//        guard let pass = passwordTextField.text else { return false }
//        return pass.count > 5
//    }
    
    func showPopup(isSuccess: Bool) {
        
      let successMessage = "User was sucessfully logged in."
      let errorMessage = "Login or password uncorrect try again"
        
      let alert = UIAlertController(title: isSuccess ? "Success": "Error", message: isSuccess ? successMessage: errorMessage, preferredStyle: UIAlertController.Style.alert)
        
        let action = isSuccess ? (UIAlertAction(title: "Done", style: UIAlertAction.Style.default) { _ in
            
            let defaults = UserDefaults.standard
            defaults.set(true, forKey:"isAuthorizedKey")
            defaults.synchronize()
            
            self.performSegue(withIdentifier: "logInSegue", sender: nil)
            
        }) : (UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        
      alert.addAction(action)
        self.display(alertController: alert)
    }
    
//    @objc func didTapFacebookButton() {
//      let loginManager = LoginManager()
//      loginManager.logIn(permissions: ["email"], from: self) { (result, error) in
//        if error != nil {
//          self.showPopup(isSuccess: false)
//          return
//        }
//        guard let token = AccessToken.current else {
//          print("Failed to get access token")
//          self.showPopup(isSuccess: false)
//          return
//        }
//
//        FirebaseAuthManager().login(credential: FacebookAuthProvider.credential(withAccessToken: token.tokenString)) {[weak self] (success) in
//          self?.showPopup(isSuccess: true)
//        }
//      }
//    }
    
    @objc func didTapLoginButton() {
        let loginManager = FirebaseAuthManager()
        guard let email = loginTextField.text, let password = passwordTextField.text else { return }
        loginManager.signIn(email: email, pass: password) {[weak self] (success) in
            self?.showPopup(isSuccess: success)
        }
    }
    
    func display(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func facebookSingInAction(_ sender: Any) {
//        didTapFacebookButton()
    }
    
    
    @IBAction func signInAction(_ sender: Any) {
        didTapLoginButton()
    }

}

extension LogInVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField: passwordTextField.becomeFirstResponder()
        default: textField.resignFirstResponder()
        }
        return true
    }
}
