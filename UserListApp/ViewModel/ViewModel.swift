//
//  ViewModel.swift
//  UserListApp
//
//  Created by Sena Kurtak on 29.01.2023.
//

import Foundation
import UIKit

class UserListViewModel {
    
    var userList = [User]()
    
    let networkManager = NetworkManager()
        
    func restapiRead(tableView: UITableView){
        networkManager.restapiRead { [self] result in
            userList = result
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
}
