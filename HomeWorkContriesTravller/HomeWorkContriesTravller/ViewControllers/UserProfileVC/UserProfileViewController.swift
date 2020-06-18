//
//  ViewController.swift
//  CountriesTraveller
//
//  Created by Steew on 14.06.2020.
//  Copyright © 2020 Steew. All rights reserved.
//

import UIKit
import Firebase
import iOSDropDown

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var genderDropDown: DropDown!
    @IBOutlet weak var timeZoneDropDown: DropDown!
    
    var genderArray = ["Male", "Female", "Other"]
    
    var user = UserProfile()
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareNextButton()
        prepareGenderDropDown()
        prepareTimeZoneDropDown()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLayoutSubviews()
    }
    
    func prepareView() {
        firstNameField.placeholder = kEnterFirstName
        lastNameField.placeholder = kEnterLastName
        emailField.placeholder = kEnterEmail
        genderDropDown.placeholder = kGenderDropDown
        timeZoneDropDown.placeholder = kTimeZoneDropDown
        view.backgroundColor = UIColor.systemOrange
    }
    
    func prepareGenderDropDown() {
    genderDropDown.optionArray = genderArray
    genderDropDown.didSelect{(selectedText , index ,id) in
//    self.genderDropDown.text = "Selected String: \(selectedText) \n index: \(index)"
        print(selectedText)
        }
    }
    
    func prepareTimeZoneDropDown() {
        timeZoneDropDown.optionArray = createTimeZoneArray()
        timeZoneDropDown.didSelect{(selectedText , index ,id) in
    //      self.genderDropDown.text = "Selected String: \(selectedText) \n index: \(index)"
            print(selectedText)
            
        }
    }
    
    func createTimeZoneArray() -> [String] {
        
        let arrayOfTimeZoneId : [String] = TimeZone.knownTimeZoneIdentifiers
        var arrayOffsetUTC : [String] = []
        var arrayOfTimeZone : [String] = []
        
        for index in 0..<arrayOfTimeZoneId.count {
            let timeZone = TimeZone(identifier: "\(TimeZone.knownTimeZoneIdentifiers[index])")
            
            arrayOffsetUTC.append((timeZone?.offsetInHours())!)
        }
        
        for index in 0..<arrayOfTimeZoneId.count {
            
            arrayOfTimeZone.append("\(arrayOffsetUTC[index]) \(arrayOfTimeZoneId[index])")
        }
        print(arrayOffsetUTC)
        print(arrayOfTimeZoneId)
        
        return arrayOfTimeZone
    }
    
    func prepareNextButton() {
        nextButton.setTitle(kNextButtonTitle, for: .normal)
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.layer.cornerRadius = 0.5 * nextButton.frame.size.width
        nextButton.clipsToBounds = true
        nextButton.backgroundColor = UIColor.blue
        
        nextButton.addTarget(self, action: #selector(onTapButtonNext), for: .touchUpInside)
    }
    
    @objc func onTapButtonNext() {
        if Validators.isValidNameField(name: firstNameField.text!) && Validators.isValidNameField(name: lastNameField.text!) &&
            Validators.isValidInputEmail(emailField.text) {
            user.firstName = firstNameField.text!
            user.lastName = lastNameField.text!
            user.email = emailField.text!
            onSecondScreen()
        } else {
            self.showAlert(title: kAlertTitleWrong, message: kAlertMessageWrong)
        }
    }
    
    func onSecondScreen() {
        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DateViewController") as? DateViewController{
            vc.user = user
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}


