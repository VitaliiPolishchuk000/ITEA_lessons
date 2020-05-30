//
//  ViewController.swift
//  HomeWork9
//
//  Created by Vitalii on 22.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//
import FirebaseAuth
import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logoutAction(_ sender: UIButton) {
    
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print (signOutError.localizedDescription)
        }

        dismiss(animated: true)
       
   }
    
}

