//
//  FCTeams.swift
//  HomeWork5
//
//  Created by Vitalii on 08.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

let countOfGames = 20

let teamPicture = ["fc1", "fc2", "fc3", "fc4", "fc5", "fc6", "fc7"]


//MARK: - Methods for Table View

func randomPicture() -> (String, String) {
    
    let randomPicture1 = teamPicture.randomElement()!
    var randomPicture2 = teamPicture.randomElement()!

    while randomPicture2 == randomPicture1 {
        randomPicture2 = teamPicture.randomElement()!
    }
        
    return (randomPicture1, randomPicture2)
}

func randomScore() -> String {
    
    let randomNumber = String(Int.random(in: 0...5))
    
    return randomNumber
}

//MARK: - Methods for Collection View

func randomImageCollection() -> String {
    
    let randomImage = teamPicture.randomElement()!
    
    return randomImage
}
