
//
//  File.swift
//  HomeWork9
//
//  Created by Vitalii on 29.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//
import UIKit
import Foundation
import Firebase

class User: Codable {
    
    let userId : String

    init (userId: String) {

        self.userId = String(userId)

    }
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        
        if writeToUserDefaults {
            
            if let data = try? JSONEncoder().encode(user) {
                
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
            }
        }

    }


}


