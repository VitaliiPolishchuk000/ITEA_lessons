//
//  NetworkManager.swift
//  HomeWork 11.1
//
//  Created by Vitalii on 04.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import Foundation

class NetworkManager {
    
    var onCompletion: ((CurrentUser) -> Void)?
    
    func fetchCurrentUser() {
        let urlString = Constants.Api.fakeApiEndpoint
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let currentUser = self.parseJSON(with: data)
                self.onCompletion?(currentUser!)
                
            }
        }
        task.resume()
    }
    
    func parseJSON(with data: Data) -> CurrentUser? {
        
        var currentUser = CurrentUser.init(currentUserData: CurrentUserData.init(firstAme: "", lastName: "", photo: "", email: ""))!
        
        do {
            let currentUserData = try JSONDecoder().decode(CurrentUserData.self, from: data)
            if CurrentUser(currentUserData: currentUserData) != nil {
                currentUser = CurrentUser(currentUserData: currentUserData)!
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return currentUser
    }
}
