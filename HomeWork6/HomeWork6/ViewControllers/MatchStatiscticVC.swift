//
//  MatchStatiscticViewController.swift
//  HomeWork6
//
//  Created by Vitalii on 12.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class MatchStatisticVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var matchStatisticTableView: UITableView!
    @IBOutlet weak var matchStatisticGoalNameTableView: UITableView!
    
//    MARK: - Properties
    
    var match: Match!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        matchStatisticTableView.delegate = self
        matchStatisticTableView.dataSource = self
        matchStatisticTableView.register(UINib(nibName: String(describing: MatchTableViewCell.self), bundle: nil), forCellReuseIdentifier: "matchTableViewCell")
        
        matchStatisticGoalNameTableView.delegate = self
        matchStatisticGoalNameTableView.dataSource = self
        matchStatisticGoalNameTableView.register(UINib(nibName: String(describing: MatchStatTableViewCell.self), bundle: nil), forCellReuseIdentifier: "matchStatTableViewCell")
        
    }
    
    //MARK: - Methods
    
    func matchGoals() -> [MatchGoals] {
        
        var goal = [MatchGoals]()
        
        for _ in 1..<(match.teamCount1 + 1) {
            
            goal.append(MatchGoals(firstTeamGoals: "firstTeamPlayer", secondTeamGoals: "-"))
            
        }
        
        for _ in 1..<(match.teamCount2 + 1) {
            
            goal.append(MatchGoals(firstTeamGoals: "-", secondTeamGoals: "secondTeamPlayer"))
            
        }
                
        return goal             //shuffled broke logic
    }
    
    
    
    //    MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
        case matchStatisticTableView:
            numberOfRow = 1
        case matchStatisticGoalNameTableView:
            numberOfRow = (match.teamCount1 + match.teamCount2)
        default:
            print("Some things Wrong!!")
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    var cellToReturn = UITableViewCell()

        if tableView == matchStatisticTableView {
        
            let  cell = tableView.dequeueReusableCell(withIdentifier: "matchTableViewCell", for: indexPath) as! MatchTableViewCell
        
            cell.firstTeamImage.image? = UIImage.init(named: match.teamImage1)!
            cell.secondTeamImage.image? = UIImage.init(named: match.teamImage2)!
            cell.firstTeamScoreLabel.text? = String(match.teamCount1)
            cell.secondTeamScoreLabel.text? = String(match.teamCount2)
            
            cellToReturn = cell
            
            } else if tableView == matchStatisticGoalNameTableView {
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "matchStatTableViewCell", for: indexPath) as! MatchStatTableViewCell
            
            cell.firstTeamGoalName.text? = matchGoals()[indexPath.row].firstTeamGoals
            cell.secondTeamGoalName.text? = matchGoals()[indexPath.row].secondTeamGoals
            
            cellToReturn = cell
        }
        
        return cellToReturn
    }
        

    
    //  MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var heightCell: CGFloat = 0.0
        
        switch tableView {
        case matchStatisticTableView:
            heightCell = 1
        case matchStatisticGoalNameTableView:
            heightCell = 10
        default:
            print("")
        }
        return tableView.frame.height / heightCell
    }

}


