//
//  CurrentUserData.swift
//  HomeWork 11.1
//
//  Created by Vitalii on 04.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import Foundation

struct CurrentUserData: Codable {
    
     let firstAme: String
     let lastName: String
     let photo: String
     let email: String
     
     enum CodingKeys: String, CodingKey {
         case firstAme = "first_ame"
         case lastName = "last_name"
         case photo
         case email
     }
    
}
