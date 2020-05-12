//
//  FCTeams.swift
//  HomeWork5
//
//  Created by Vitalii on 08.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit
let teamPicture = ["fc1", "fc2", "fc3", "fc4", "fc5", "fc6", "fc7", "fc8", "fc9", "fc10"]
let teamCount = teamPicture.count

class Match {
    
    var teamImage1: String
    var teamImage2: String
    var teamCount1: Int
    var teamCount2: Int
    
    init(teamImage1: String, teamImage2: String, teamCount1: Int, teamCount2: Int) {
        
        self.teamImage1 = teamImage1
        self.teamImage2 = teamImage2
        self.teamCount1 = teamCount1
        self.teamCount2 = teamCount2
        
    }
    
}

//MARK: - Methods for Table View

 func countOfGames() -> Int{
        
        var countOfGames = 0
        
        for i in 1..<teamCount {
            countOfGames += i
        }
        
        return countOfGames
    }

func matchesResults() -> [Match] {
    
    var matches = [Match]()
    
    func randomScore() -> Int {
        
        let randomNumber = Int.random(in: 0...4)
        
        return randomNumber
    }

    func machesResultUnshuffled() -> [Match] {
        
        var machesUnshuffled = [Match]()
        var turnamArrayOfTeams = [String]()
        var turnamentArraysOFTeams = [[String]]()

        for indexInTeamPicture in 1..<teamPicture.count {
                   
            turnamArrayOfTeams = []
                   
            for a in indexInTeamPicture..<teamPicture.count {
                      
                turnamArrayOfTeams.append(teamPicture[a])
            }
                   
            turnamentArraysOFTeams.append(turnamArrayOfTeams)

        }

        for b in 0..<(teamPicture.count - 1) {

            for c in 0..<turnamentArraysOFTeams[b].count {

            machesUnshuffled.append(Match(teamImage1: teamPicture[b], teamImage2: turnamentArraysOFTeams[b][c], teamCount1: randomScore(), teamCount2: randomScore()))

            }
        }
        
        return machesUnshuffled.shuffled()
    }

    matches = machesResultUnshuffled()
        
    return matches
}

//MARK: - Methods for Collection View

func randomImageCollection() -> String {
    
    let randomImage = teamPicture.randomElement()!
    
    return randomImage
}
