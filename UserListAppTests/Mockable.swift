//
//  Mockable.swift
//  UserListAppTests
//
//  Created by Sena Kurtak on 31.01.2023.
//

import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    
    func loadJSON<T:Decodable>(filename: String, type: T.Type) -> [T]
}

extension Mockable {
    
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T:Decodable>(filename: String, type: T.Type) -> [T] {
        
        // we are going to decode data from this json file which was created
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON file")
        }
        
        do{
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode([T].self, from: data)
            return decodedObject
        } catch {
            print("😖\(error)")
            fatalError("Failed to decode the json")
        }
    }
}
