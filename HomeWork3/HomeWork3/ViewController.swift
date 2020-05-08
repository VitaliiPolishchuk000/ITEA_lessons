//
//  ViewController.swift
//  HomeWork3
//
//  Created by Vitalii on 02.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlet
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someTextField: UITextField!
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var stuNameSurn: UILabel!
    @IBOutlet weak var studentAge: UILabel!
    @IBOutlet weak var studentPhoneNumber: UILabel!
    @IBOutlet weak var studentEmail: UILabel!
    
    //MARK: - Properties
    var studentsArray = [Students]()
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentsArray = createStArray()
        
        someTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    //MARK: - Methods
    func searchStudent() -> Students? {
        var studentInfo: Students?
           for student in studentsArray {
            if student.name.lowercased() == someTextField.text?.lowercased() {
                studentInfo = student
               }
           }
        return studentInfo
       }
    
    func showStudent(student: Students?) {
        if let studInfo = student {
            stuNameSurn.text = "\(studInfo.name) \(studInfo.surname)"
            studentAge.text = "\(studInfo.age) years old"
            studentPhoneNumber.text = String(studInfo.phone)
            studentEmail.text = studInfo.email
            studentImage.image = studInfo.picture
        }
    }
    
    //MARK: - Keybord Notification
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }

    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - IBAction
    @IBAction func searchButton(_ sender: UIButton) {
        
        if let student = searchStudent() {
                   showStudent(student: student)
        } else {
            let alertController = UIAlertController.init(title: nil, message: "Wrong name!", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "Ok", style: .default) { (action) in}
            
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }

}
