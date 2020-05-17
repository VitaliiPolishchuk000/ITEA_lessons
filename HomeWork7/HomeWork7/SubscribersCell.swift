//
//  SubscribersCell.swift
//  HomeWork7
//
//  Created by Vitalii on 16.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class SubscribersCell: UITableViewCell {

    @IBOutlet weak var subscriberImage: UIImageView!
    @IBOutlet weak var subscriberNumberLabel: UILabel!
    @IBOutlet weak var subscriberAdressLabel: UILabel!
    @IBOutlet weak var subscriberEmailLabel: UILabel!
    @IBOutlet weak var subscriberFullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
