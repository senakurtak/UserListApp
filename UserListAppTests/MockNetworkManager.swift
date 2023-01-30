//
//  MockNetworkManager.swift
//  UserListAppTests
//
//  Created by Sena Kurtak on 31.01.2023.
//

import Foundation
@testable import UserListApp

final class MockNetworkManager: NetworkMangerProtocol, Mockable{
    
    func fetchUserInformations(completion: @escaping ([UserListApp.User]) -> Void) {
    
        return loadJSON(filename: String, type: User) -> [UserListApp.User]
        
    }
}
