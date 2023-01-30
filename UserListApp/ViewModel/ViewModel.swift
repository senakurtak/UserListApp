//
//  ViewModel.swift
//  UserListApp
//
//  Created by Sena Kurtak on 29.01.2023.
//

import Foundation

class UserListViewModel {
    var userLists: [User] = []
    let session = URLSession.shared
    let url = URL(string: "https://reqres.in/api/users?page=2")
    init() {}
    
    func getUserlist(_ completion: @escaping (Bool) -> Void) {
        let dataTask = session.dataTask(with: url!, completionHandler: {[weak self] data, response, error in
            if error == nil {
                do {
                    let response = try JSONDecoder().decode([User].self, from: data!)
                    self?.userLists = response
                    completion(true)
                } catch {
                    print(error)
                     completion(false)
                }
            }
       })
        dataTask.resume()
    }
}

