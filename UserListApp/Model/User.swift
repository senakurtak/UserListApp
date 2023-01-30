//
//  User.swift
//  UserListApp
//
//  Created by Sena Kurtak on 29.01.2023.
//

// https://reqres.in/api/users?page=1

import Foundation
//
// MARK: - User
class Datum: Decodable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
class User: Codable {
    let id: Int
    let email: String?
    let firstName : String?
    let lastName: String?
    let avatar: String?
    
}
//
// MARK: - Support
class Support: Codable {
    let url: String
    let text: String
}
