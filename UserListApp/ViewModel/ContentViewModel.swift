//
//  ViewModel.swift
//  UserListApp
//
//  Created by Sena Kurtak on 29.01.2023.
//

import Foundation
import UIKit

protocol UsersViewModelDelegate {
    func onSuccessfullMoviesLoaded()
}


class ContentViewModel {
    
    var userList = [User]()
    
    var delegate : UsersViewModelDelegate?
    
//    let networkManagerShared = NetworkManager()
      
    var networkManager : NetworkMangerProtocol!
    
    init(networkManager: NetworkMangerProtocol){
        self.networkManager = networkManager
    }
    
    func restapiRead(){
        networkManager.fetchUserInformations { [self] result in
            userList = result
            DispatchQueue.main.async {
                self.delegate?.onSuccessfullMoviesLoaded()
            }
        }
    }
}
