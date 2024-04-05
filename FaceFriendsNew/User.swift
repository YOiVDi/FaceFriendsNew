//
//  User.swift
//  FaceFriendsNew
//
//  Created by Yordan Dimitrov on 05.04.24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
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
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    static var exampleUser = User(id: UUID().uuidString, name: "Test", isActive: false, age: 21, company: "TestCompany", email: "Test@Email.com", address: "Some street 21 New York", about: "There is not about information", registered: "2015-11-10T01:47:18-00:00", tags: ["cillum", "consequat", "deserunt", "eiusmod", "minim", "tempor"], friends: [Friends(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"), Friends(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton")])
}

struct Friends: Identifiable, Codable {
    var id: String
    var name: String
}
