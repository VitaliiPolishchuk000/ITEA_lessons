//
//  AddSubscriberVC.swift
//  HomeWork7
//
//  Created by Vitalii on 16.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit
import CoreData

class AddSubscriberVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//
//      guard let appDelegate =
//        UIApplication.shared.delegate as? AppDelegate else {
//          return
//      }
//
//      let managedContext = appDelegate.persistentContainer.viewContext
//
//      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Subscriber")
//
//      do {
//        subscribers = try managedContext.fetch(fetchRequest)
//      } catch let error as NSError {
//        print("Could not fetch. \(error), \(error.userInfo)")
//      }
//    }
    
    
    
    @IBAction func addSubscriber(_ sender: Any) {
    
//        save(name: nameTextField.text!, surname: surnameTextField.text!,  email: emailTextField.text!, adress: adressTextField.text!, number: numberTextField.text!)
        
    }
}


