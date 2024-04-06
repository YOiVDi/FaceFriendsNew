//
//  UserDetailView.swift
//  FaceFriendsNew
//
//  Created by Yordan Dimitrov on 05.04.24.
//

import SwiftData
import SwiftUI

struct UserDetailView: View {
    var user: User

    var body: some View {
        List {
            Group {
                Section("Personal Info") {
                    Text("Age: \(user.age)")
                        .font(.headline)
                    Text("Address: \(user.address)")
                        .font(.headline)
                    Text("Email: \(user.email)")
                        .font(.headline)
                    Text("Registered: \(user.registered)")
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.9)
                }
                Section("Friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
                
                Section("About") {
                    Text("\(user.about)")
                        .font(.headline)
                }
            }
        }
        .navigationTitle("\(user.name)")
    }
}

#Preview {
    do {
        let config = ModelConfiguration(for: User.self, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let exampleUser = User(id: UUID().uuidString, name: "Test", isActive: false, age: 21, company: "TestCompany", email: "Test@Email.com", address: "Some street 21 New York", about: "There is not about information", registered: "2015-11-10T01:47:18-00:00", tags: ["cillum", "consequat", "deserunt", "eiusmod", "minim", "tempor"], friends: [Friends(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"), Friends(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton")])
        
        return  NavigationStack { UserDetailView(user: exampleUser) }
            .modelContainer(container)
    } catch {
        return Text("Can't create view.")
    }
}
