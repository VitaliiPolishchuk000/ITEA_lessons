//
//  SecondViewController.swift
//  HomeWork8
//
//  Created by Vitalii on 21.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var teamsCollView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teamsCollView.dataSource = self
        self.teamsCollView.delegate = self
        self.teamsCollView.register(UINib.init(nibName: "TeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "teamsCollectionViewID")
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (CGSize(width: 100, height: 100))
        teamsCollView.collectionViewLayout = layout
    }
    
    
// MARK: Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCollectionViewID", for: indexPath as IndexPath) as! TeamsCollectionViewCell
        
        cell.teamsImageView.image? = UIImage.init(named: teamNames[indexPath.row])!
        
        return cell
    }
    
//  MARK: - Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let playersVC = storyboard.instantiateViewController(identifier: "playersID") as! PlayersVC
        playersVC.teamImage = teamNames[indexPath.row]
        self.navigationController?.pushViewController(playersVC, animated: true)
        
    }
    
}

