//
//  ViewController.swift
//  HomeWork 11.1
//
//  Created by Vitalii on 04.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    var networkManager = NetworkManager()
      
      override func viewDidLoad() {
          super.viewDidLoad()
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "urlSessionSegueID" {
              guard let svc = segue.destination as? SecondViewController else { return }
              
              networkManager.fetchCurrentUser()
              networkManager.onCompletion = { [weak self] currentUser in
                  guard self != nil else { return }
                  svc.updateInterface(with: currentUser)
              }
          }
          
          if segue.identifier == "alamofireSegueID" {
              guard let svc = segue.destination as? SecondViewController else { return }
              
            AF.request(Constants.Api.fakeApiEndpoint).response { response in
                  guard let data = response.data else { return }
                  if let currentUser = self.networkManager.parseJSON(with: data) {
                      svc.updateInterface(with: currentUser)
                  }
              }
              
          }
      }
      
}


