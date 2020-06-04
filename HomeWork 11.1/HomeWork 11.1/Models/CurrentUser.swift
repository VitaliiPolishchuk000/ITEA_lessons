//
//  CurrentUser.swift
//  HomeWork 11.1
//
//  Created by Vitalii on 04.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import Foundation

struct CurrentUser {
    
    let firstName: String
    let lastName: String
    var fullName: String {
        return lastName + " " + firstName
    }
    let email: String
    let photo: String
    
    init?(currentUserData: CurrentUserData) {
        
        firstName = currentUserData.firstAme
        lastName = currentUserData.lastName
        email = currentUserData.email
        photo = currentUserData.photo
        
    }
    
}
