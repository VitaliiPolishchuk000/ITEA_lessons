//
//  PlayersVC.swift
//  HomeWork8
//
//  Created by Vitalii on 21.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import Foundation
import UIKit

class PlayersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var teamImageView: UIImageView!
    
    @IBOutlet weak var playersTableView: UITableView!
    
    var teamImage: String = ""
    
    var players = addPlayers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playersTableView.delegate = self
        playersTableView.dataSource = self
        teamImageView.image? = UIImage.init(named: teamImage)!

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = tableView.dequeueReusableCell(withIdentifier: "playersCellID", for: indexPath)
        
        cell.textLabel?.text = players[indexPath.row].fullName

        return cell
    }
    
        
}

