//
//  Player.swift
//  HomeWork8
//
//  Created by Vitalii on 21.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import Foundation

let names = ["Oliver", "Jake", "Noah", "James", "Jack", "Connor", "Liam", "John", "Harry", "Callum", "Mason", "Joe", "Jacob", "Jacob", "Daniel", "Oscar", "Kyle", "William", "Thomas", "James"]

let surnames = ["Smith", "Brown", "Jones", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Hall", "Hill", "Allen", "Young", "King", "Lopez", "Scott", "Green", "Adams", "Baker", "Nelson", "Young"]



class Player {
    let name: String
    let surname: String
    var fullName: String { return name + " " + surname }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        
    }
    
}

func addPlayers () -> [Player] {
    
    var players = [Player]()
    
    for _ in 0...100 {
    
        players.append(Player(name: names.randomItem()!, surname: surnames.randomItem()!))
    
    }
    return players
}

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
