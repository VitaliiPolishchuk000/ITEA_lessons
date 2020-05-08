//
//  Students.swift
//  HomeWork3
//
//  Created by Vitalii on 08.05.2020.
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

var studentArrayInfo = [Students]()

func createStArray () -> [Students] {
    
    studentArrayInfo.append(Students(name: "Vasiliy", surname: "Petrov", phone: 23355, age: 22, picture: UIImage(named: "student1")!, email: "vasiliypetrov@email.com"))
    studentArrayInfo.append(Students(name: "Ivan", surname: "Popov", phone: 45563, age: 23, picture: UIImage(named: "student2")!, email: "ivanpopov@email.com"))
    studentArrayInfo.append(Students(name: "Potap", surname: "Kotov", phone: 83324, age: 20, picture: UIImage(named: "student3")!, email: "potapkotov@email.com"))
    studentArrayInfo.append(Students(name: "Inokentiy", surname: "Stenov", phone: 84352, age: 20, picture: UIImage(named: "student4")!, email: "inokentiystenov@email.com"))
    studentArrayInfo.append(Students(name: "Goga", surname: "Batonov", phone: 34554, age: 20, picture: UIImage(named: "student5")!, email: "gogabatonov@email.com"))
    studentArrayInfo.append(Students(name: "Vasiliy", surname: "Petrov", phone: 23355, age: 22, picture: UIImage(named: "student1")!, email: "vasiliypetrov@email.com"))
    
    return studentArrayInfo
}
