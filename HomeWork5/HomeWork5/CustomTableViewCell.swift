//
//  CustomTableViewCell.swift
//  HomeWork5
//
//  Created by Vitalii on 08.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var firstTeamScoreLabel: UILabel!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var secondTeamScoreLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
