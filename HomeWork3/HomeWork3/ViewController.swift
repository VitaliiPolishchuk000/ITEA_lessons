//
//  ViewController.swift
//  HomeWork3
//
//  Created by Vitalii on 02.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someTextField: UITextField!
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var stuNameSurn: UILabel!
    @IBOutlet weak var studentAge: UILabel!
    @IBOutlet weak var studentPhoneNumber: UILabel!
    @IBOutlet weak var studentEmail: UILabel!
    
    
    
    var studentsArray = [Students] ()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentsArray = createStArray()  // равно тому, что выведет функция?

    }


    struct Students {
        var name : String
        var surname : String
        var phone : UInt
        var age : Int
        var picture : UIImage
        var email : String

    }

    func createStArray () -> [Students] {
        
        let student1 = Students(name: "Vasiliy", surname: "Petrov", phone: 23355, age: 22, picture: UIImage(named: "student1")!, email: "vasiliypetrov@email.com")
        let student2 = Students(name: "Ivan", surname: "Popov", phone: 45563, age: 23, picture: UIImage(named: "student2")!, email: "ivanpopov@email.com")
        let student3 = Students(name: "Potap", surname: "Kotov", phone: 83324, age: 20, picture: UIImage(named: "student3")!, email: "potapkotov@email.com")
        let student4 = Students(name: "Inokentiy", surname: "Stenov", phone: 84352, age: 20, picture: UIImage(named: "student4")!, email: "inokentiystenov@email.com")
        let student5 = Students(name: "Goga", surname: "Batonov", phone: 34554, age: 20, picture: UIImage(named: "student5")!, email: "gogabatonov@email.com")
        
    return [student1, student2, student3, student4, student5]
    }
    
    func searchStudent() -> Students? {
           for student in self.studentsArray {
               if student.name.lowercased() == self.someTextField.text?.lowercased() {
                   return student
               }
           }
           return nil
       }
    
    func showStudent(student: Students?) {
        if let studInfo = student {
            self.stuNameSurn.text = "\(studInfo.name) \(studInfo.surname)"
            self.studentAge.text = "\(studInfo.age) years old"
            self.studentPhoneNumber.text = String(studInfo.phone)
            self.studentEmail.text = studInfo.email
            self.studentImage.image = studInfo.picture
        }
    }
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        if let student = searchStudent() {
                   showStudent(student: student)
        } else {
            print("ERROR!!!")
            print(studentsArray)
        }
    }
    
    
}




//In textField enter the name of student - by click on button show the searching result (all properties of the student)
