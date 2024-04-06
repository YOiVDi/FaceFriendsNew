//
//  User.swift
//  FaceFriendsNew
//
//  Created by Yordan Dimitrov on 05.04.24.
//

import Foundation
import SwiftData

@Model
class User: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    var isActive: Bool
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friends]
    
    
    enum CodingKeys: CodingKey {
        case id, name, isActive, age, company, address, email, about, registered, tags, friends
    }
    
    init(id: String, name: String, isActive: Bool, age: Int, company: String, email: String, address: String, about: String, registered: String, tags: [String], friends: [Friends]) {
        self.id = id
        self.name = name
        self.isActive = isActive
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        age = try container.decode(Int.self, forKey: .age)
        company = try container.decode(String.self, forKey: .company)
        email = try container.decode(String.self, forKey: .email)
        address = try container.decode(String.self, forKey: .address)
        about = try container.decode(String.self, forKey: .about)
        registered = try container.decode(String.self, forKey: .registered)
        tags = try container.decode([String].self, forKey: .tags)
        friends = try container.decode([Friends].self, forKey: .friends)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(address, forKey: .address)
        try container.encode(email, forKey: .email)
        try container.encode(about, forKey: .about)
        try container.encode(registered, forKey: .registered)
        try container.encode(tags, forKey: .tags)
        try container.encode(friends, forKey: .friends)
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
//    static var exampleUser = User(id: UUID().uuidString, name: "Test", isActive: false, age: 21, company: "TestCompany", email: "Test@Email.com", address: "Some street 21 New York", about: "There is not about information", registered: "2015-11-10T01:47:18-00:00", tags: ["cillum", "consequat", "deserunt", "eiusmod", "minim", "tempor"], friends: [Friends(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"), Friends(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton")])
}

struct Friends: Identifiable, Codable {
    var id: String
    var name: String
}


