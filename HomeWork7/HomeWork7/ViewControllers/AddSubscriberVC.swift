//
//  AddSubscriberVC.swift
//  HomeWork7
//
//  Created by Vitalii on 16.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit
import CoreData

protocol AddNewSubscriberDelegate {
    func saveNewSubscriber(name: String, surname: String, email: String, adress: String, number: String)

}

class AddSubscriberVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var delegate: AddNewSubscriberDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func onBack () {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func addSubscriber(_ sender: Any) {
        
        if let delegate = delegate {
        
        delegate.saveNewSubscriber(name: nameTextField.text!, surname: surnameTextField.text!,  email: emailTextField.text!, adress: adressTextField.text!, number: numberTextField.text!)
        onBack()
        }
    }
}


