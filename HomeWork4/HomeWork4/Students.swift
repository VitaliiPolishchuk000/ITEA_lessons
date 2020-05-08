//
//  Students.swift
//  HomeWork4
//
//  Created by Vitalii on 07.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class Students {
       var name : String
       var surname : String
       var phone : UInt
       var age : Int
       var picture : UIImage
       var email : String
    
    init(name: String, surname: String, phone: UInt, age: Int, picture: UIImage, email: String) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.age = age
        self.picture = picture
        self.email = email
    }
    
}

    class DeductionStudents : Students {
        
        var status: StudentStatus
        var fullname: String {
            return name + " " + surname
        }
        
        
        init(name: String, surname: String, phone: UInt, age: Int, picture: UIImage, email: String, status: StudentStatus) {
            
            self.status = status
            super.init(name: name, surname: surname, phone: phone, age: age, picture: picture, email: email)
        }
        
        enum StudentStatus: String {
            case Study = "Study"
            case Deducted = "Deducted"
        }
    }


func createStArray () -> [DeductionStudents] {
    var studentsArray = [DeductionStudents]()
    studentsArray.append(DeductionStudents(name: "Vasiliy", surname: "Petrov", phone: 23355, age: 22, picture: UIImage(named: "student1")!, email: "vasiliypetrov@email.com", status: .Study))
    studentsArray.append(DeductionStudents(name: "Ivan", surname: "Popov", phone: 45563, age: 23, picture: UIImage(named: "student2")!, email: "ivanpopov@email.com", status: .Study))
    studentsArray.append(DeductionStudents(name: "Potap", surname: "Kotov", phone: 83324, age: 20, picture: UIImage(named: "student3")!, email: "potapkotov@email.com", status: .Study))
    studentsArray.append(DeductionStudents(name: "Inokentiy", surname: "Stenov", phone: 84352, age: 20, picture: UIImage(named: "student4")!, email: "inokentiystenov@email.com", status: .Study))
    studentsArray.append(DeductionStudents(name: "Goga", surname: "Batonov", phone: 34554, age: 20, picture: UIImage(named: "student5")!, email: "gogabatonov@email.com", status: .Deducted))
    studentsArray.append(DeductionStudents(name: "Kate", surname: "Bush", phone: 75533, age: 19, picture: UIImage(named: "student1")!, email: "katebush@email.com", status: .Study))
    studentsArray.append(DeductionStudents(name: "Pate", surname: "Dush", phone: 344533, age: 19, picture: UIImage(named: "student2")!, email: "patedush@email.com", status: .Study))
    studentsArray.append(DeductionStudents(name: "Mate", surname: "Bushemy", phone: 74333, age: 18, picture: UIImage(named: "student3")!, email: "matebushemy@email.com", status: .Study))
    
        print(studentsArray)
    return studentsArray
}



