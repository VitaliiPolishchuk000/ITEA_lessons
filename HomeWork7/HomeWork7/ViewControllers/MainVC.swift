//
//  ViewController.swift
//  HomeWork7
//
//  Created by Vitalii on 16.05.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit
import CoreData

var subscribers: [NSManagedObject] = []

class mainVC: UIViewController {
    
    @IBOutlet weak var phoneBookTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneBookTableView.delegate = self
        phoneBookTableView.dataSource = self
        phoneBookTableView.register(UINib(nibName: String(describing: SubscribersCell.self), bundle: nil), forCellReuseIdentifier: "subscribersCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
          return
      }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Subscriber")
      
      do {
        subscribers = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }

    
    @IBAction func addSubscriber(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let addSubscriberVC = storyboard.instantiateViewController(identifier: "addSubscriberID") as! AddSubscriberVC
        self.navigationController?.pushViewController(addSubscriberVC, animated: true)
        
        
//        self.phoneBookTableView.reloadData()
        }

//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

//        alert.addTextField()

//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)

//        present(alert, animated: true)
    func save(name: String, surname: String, email: String, adress: String, number: String) {
           
             guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                 return
             }
               
             let managedContext = appDelegate.persistentContainer.viewContext
               
             let entity = NSEntityDescription.entity(forEntityName: "Subscriber", in: managedContext)!
               
             let person = NSManagedObject(entity: entity, insertInto: managedContext)
               
             person.setValue(name, forKeyPath: "name")
             person.setValue(surname, forKey: "surname")
             person.setValue(email, forKey: "email")
             person.setValue(adress, forKey: "adress")
             person.setValue(number, forKey: "number")
           
             do {
                 try managedContext.save()
                 subscribers.append(person)
             } catch let error as NSError {
                 print("Could not save. \(error), \(error.userInfo)")
             }
      }
   
}

// MARK: - UITableViewDataSource

extension mainVC: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return subscribers.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let subscriber = subscribers[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "subscribersCell", for: indexPath) as! SubscribersCell

    cell.subscriberFullName?.text = subscriber.value(forKeyPath: "name") as? String
    cell.subscriberNumberLabel?.text = subscriber.value(forKeyPath: "number") as? String
    cell.subscriberEmailLabel?.text = subscriber.value(forKeyPath: "email") as? String
    cell.subscriberAdressLabel?.text = subscriber.value(forKeyPath: "adress") as? String

//    cell.subscriberImage?.image = UIImage.init()
    return cell
  }
}

// MARK: - UITableViewDelegate

extension mainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height / 7
    }
}
