//
//  ViewController.swift
//  HomeWork4
//
//  Created by Vitalii on 07.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
//MARK: - IBOutlets
    @IBOutlet weak var someTable: UITableView!
    
//MARK: - Properties
    var studentsArray = [DeductionStudents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentsArray = createStArray()
        self.someTable.delegate = self
        self.someTable.dataSource = self
        
    }

//MARK: - table view delegate methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsArray.count
       }
       
      public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "someCell", for: indexPath)
//           cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"
        
        
        cell.textLabel?.text = self.studentsArray[indexPath.row].fullname
        cell.detailTextLabel?.text = String(self.studentsArray[indexPath.row].phone) + " " + self.studentsArray[indexPath.row].status.rawValue
        cell.imageView?.image = studentsArray[indexPath.row].picture
        return cell
        
       }
    
}

