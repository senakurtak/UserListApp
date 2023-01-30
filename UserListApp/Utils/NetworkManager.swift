//
//  NetworkManager.swift
//  UserListApp
//
//  Created by Sena Kurtak on 30.01.2023.
//

import Foundation

class NetworkManager {
    
    func restapiRead(completion: @escaping ([User])-> Void){
        var request = URLRequest(url: URL(string: "https://reqres.in/api/users?page=1")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let result = try JSONDecoder().decode(Result.self, from: data!)
                completion(result.data)
            } catch {
                print("error")
            }
        })
        task.resume()
    }
}
