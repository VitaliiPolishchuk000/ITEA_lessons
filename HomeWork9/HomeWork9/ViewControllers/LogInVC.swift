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
import GoogleSignIn

class LogInVC: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var faceBookLoginButton: FBLoginButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        faceBookLoginButton.delegate = self
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.performSegue(withIdentifier: "logInSegue", sender: nil)
//
//        let defaults = UserDefaults.standard
//        if defaults.string(forKey: "isAuthorizedKey") == "true" {
//
//            self.performSegue(withIdentifier: "logInSegue", sender: nil)
//
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showPopup(isSuccess: Bool) {
        
      let successMessage = "User was sucessfully logged in."
      let errorMessage = "Login or password uncorrect try again"
        
      let alert = UIAlertController(title: isSuccess ? "Success": "Error", message: isSuccess ? successMessage: errorMessage, preferredStyle: UIAlertController.Style.alert)
        
        let action = isSuccess ? (UIAlertAction(title: "Done", style: UIAlertAction.Style.default) { _ in
            
            if let user = Auth.auth().currentUser?.uid {
                User.setCurrent(User.init(userId: user), writeToUserDefaults: true)
            }
            self.performSegue(withIdentifier: "logInSegue", sender: nil)
            
        }) : (UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        
      alert.addAction(action)
        self.display(alertController: alert)
    }
    
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

extension LogInVC: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
          print(error.localizedDescription)
          return
        }
        
        guard result!.isCancelled == false else { return }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
            window?.rootViewController?.performSegue(withIdentifier: "logInSegue", sender: nil)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
}
