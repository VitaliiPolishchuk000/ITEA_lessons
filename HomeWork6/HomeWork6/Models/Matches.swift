//
//  Matches.swift
//  HomeWork6
//
//  Created by Vitalii on 12.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

let teamNames = ["Atletico", "Barcelona", "Deportivo", "Malaga", "Osasuna", "Real-Zaragoza", "RealMadrid", "Tenerife", "Valencia", "Villareal"]
let teamCount = teamNames.count

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

//MARK: - Methods for matchTableView

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

        for indexInTeamPicture in 1..<teamNames.count {
                   
            turnamArrayOfTeams = []
                   
            for a in indexInTeamPicture..<teamNames.count {
                      
                turnamArrayOfTeams.append(teamNames[a])
            }
                   
            turnamentArraysOFTeams.append(turnamArrayOfTeams)

        }

        for b in 0..<(teamNames.count - 1) {

            for c in 0..<turnamentArraysOFTeams[b].count {

            machesUnshuffled.append(Match(teamImage1: teamNames[b], teamImage2: turnamentArraysOFTeams[b][c], teamCount1: randomScore(), teamCount2: randomScore()))

            }
        }
        
        return machesUnshuffled.shuffled()
    }

    matches = machesResultUnshuffled()
        
    return matches
}

class MatchGoals {
    
    var firstTeamGoals: String
    var secondTeamGoals: String
    
    init(firstTeamGoals: String, secondTeamGoals: String) {
     
        self.firstTeamGoals = firstTeamGoals
        self.secondTeamGoals = secondTeamGoals
    }
    
}




