//
//  ViewController.swift
//  HomeWork5
//
//  Created by Vitalii on 08.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
//  MARK: - IBOutlets
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    
// MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
      
        myTableView.delegate = self
        myTableView.dataSource = self
          myTableView.register(UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil), forCellReuseIdentifier: "customCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (CGSize(width: 90, height: 90))
        myCollectionView.collectionViewLayout = layout
        
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: String(describing: CustomCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: "customCollectionCell")
        
        
        
        

    }

//MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.firstTeamImage.image? = UIImage.init(named: randomPicture().0)! // don't work without default picture
        cell.secondTeamImage.image? = UIImage.init(named: randomPicture().1)!
        cell.firstTeamScoreLabel.text? = randomScore()
        cell.secondTeamScoreLable.text? = randomScore()
        
        return cell
    }

}


//MARK: - Collection View Delegate

extension UIViewController: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//MARK: - Collection View Data Source

extension UIViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.firstCollImage.image? = UIImage.init(named: randomImageCollection())!
        cell.secondCollImage.image? = UIImage.init(named: randomImageCollection())!
        cell.thridCollImage.image? = UIImage.init(named: randomImageCollection())!
        cell.fourthCollImage.image? = UIImage.init(named: randomImageCollection())!
        
        return cell
    }
}

//MARK: - Collection Viev DelegateFlowLoyaut
extension UIViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 90)
    }
}

