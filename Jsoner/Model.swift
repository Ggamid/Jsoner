//
//  Model.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//

import Foundation


class Network {
    
    static func fetchData() async throws -> [User]{
        if let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json"){
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode([User].self, from: data)
            return decoded
        }
        throw Errors.somethingWrong
    }
    
    enum Errors: LocalizedError{
        case somethingWrong
    }
}
