//
//  MatchStatTableViewCell.swift
//  HomeWork6
//
//  Created by Vitalii on 14.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class MatchStatTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTeamGoalName: UILabel!
    @IBOutlet weak var secondTeamGoalName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
