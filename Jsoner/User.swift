//
//  User.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//

import SwiftData
import Foundation

@Model
class User: Codable {
    
    enum CodingKeys: CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends

    }
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    var registered: String
    let tags: [String]
    let friends: [Friend]
    
    var displayedDate: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let dateToFormat = dateFormatter.date(from: registered) ?? Date.now
        return dateToFormat.formatted(.iso8601.year().month().day())
    }
    
    init(id: String, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: String, tags: [String], friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
        
    }

//    
    required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(String.self, forKey: .id)
            self.name = try container.decode(String.self, forKey: .name)
            self.isActive = try container.decode(Bool.self, forKey: .isActive)
            self.age = try container.decode(Int.self, forKey: .age)
            self.company = try container.decode(String.self, forKey: .company)
            self.email = try container.decode(String.self, forKey: .email)
            self.address = try container.decode(String.self, forKey: .address)
            self.about = try container.decode(String.self, forKey: .about)
            self.registered = try container.decode(String.self, forKey: .registered)
            self.tags = try container.decode([String].self, forKey: .tags)
            self.friends = try container.decode([Friend].self, forKey: .friends)
        
        }
    
    func encode(to encoder: any Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.isActive, forKey: .isActive)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.about, forKey: .about)
        try container.encode(self.registered, forKey: .registered)
        try container.encode(self.tags, forKey: .tags)
        try container.encode(self.friends, forKey: .friends)
        
    }
   
}


@Model
class Friend: Codable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<Friend.CodingKeys> = try decoder.container(keyedBy: Friend.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: Friend.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: Friend.CodingKeys.name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
