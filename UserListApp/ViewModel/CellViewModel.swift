//
//  CellViewModel.swift
//  UserListApp
//
//  Created by Sena Kurtak on 30.01.2023.
//

import Foundation
class UserCellViewModel {
    var fullName: String
    var email: String
    var imageUrl: URL?
    
    init(withUser user: User) {
        self.fullName = "\(user.firstName ?? "") \(user.lastName ?? "")"
        email = user.email ?? ""
        guard let str = user.avatar, let url = URL(string: str) else {return}
        self.imageUrl = url
    }
}
