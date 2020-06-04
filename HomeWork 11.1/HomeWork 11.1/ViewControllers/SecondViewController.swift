//
//  SecondViewController.swift
//  HomeWork 11.1
//
//  Created by Vitalii on 04.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var userFullNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func updateInterface(with user: CurrentUser) {
        DispatchQueue.main.async {
            self.userFullNameLabel.text = user.fullName
            self.userEmailLabel.text = user.email
            self.fetchImage(with: user.photo)
        }
    }

    private func fetchImage(with urlString: String) {
        let imageURL = URL(string: urlString)
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        userPhotoImageView.image = UIImage(data: imageData)
    }
    
}
