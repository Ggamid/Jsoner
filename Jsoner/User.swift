//
//  User.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//

import Foundation

struct User: Codable{
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
    
    struct Friend: Codable {
        let id: String
        let name: String
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
    
}
