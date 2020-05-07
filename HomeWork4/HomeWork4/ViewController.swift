//
//  ViewController.swift
//  HomeWork4
//
//  Created by Vitalii on 07.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var someTable: UITableView!
    
    var studentsArray = [Students]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentsArray = createStArray()
        self.someTable.delegate = self
        self.someTable.dataSource = self
        
    }

//MARK: - table view delegate methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 10
       }
       
      public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "someCell", for: indexPath)
//           cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"
        
        
        cell.textLabel?.text = self.studentsArray[indexPath.row].name
        cell.textLabel?.text = self.studentsArray[indexPath.row].surname
        cell.detailTextLabel?.text = String(self.studentsArray[indexPath.row].phone)
        cell.textLabel?.text = self.studentsArray[indexPath.row].email
//        cell.textLabel?.text = self.studentsArray[indexPath.row].status ???
        cell.imageView?.image = studentsArray[indexPath.row].picture
        
        
        return cell
        
       }
    
}

