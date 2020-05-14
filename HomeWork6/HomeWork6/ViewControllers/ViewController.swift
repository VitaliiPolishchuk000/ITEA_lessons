//
//  ViewController.swift
//  HomeWork6
//
//  Created by Vitalii on 12.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var matchTableView: UITableView!
    
    var matches = matchesResults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchTableView.delegate = self
        matchTableView.dataSource = self
        matchTableView.register(UINib(nibName: String(describing: MatchTableViewCell.self), bundle: nil), forCellReuseIdentifier: "matchTableViewCell")
        
    }
    
//    MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return countOfGames()
       }
       
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
       let cell = tableView.dequeueReusableCell(withIdentifier: "matchTableViewCell") as! MatchTableViewCell
          
        cell.firstTeamImage.image? = UIImage.init(named: matches[indexPath.row].teamImage1)!
        cell.secondTeamImage.image? = UIImage.init(named: matches[indexPath.row].teamImage2)!
        cell.firstTeamScoreLabel.text? = String(matches[indexPath.row].teamCount1)
        cell.secondTeamScoreLabel.text? = String(matches[indexPath.row].teamCount2)
           
       return cell
   }
//  MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let matchStaticticVC = storyboard.instantiateViewController(identifier: "matchStatisticID") as! MatchStatisticVC
        matchStaticticVC.match = matches[indexPath.row]
        self.navigationController?.pushViewController(matchStaticticVC, animated: true)
    
    }

}


