//
//  FriendDetailView.swift
//  FaceFriendsNew
//
//  Created by Yordan Dimitrov on 05.04.24.
//

import SwiftUI

struct FriendDetailView: View {
    var user: User
    var body: some View {
        List {
            Group {
                Section("Age") {
                    Text("\(user.age)")
                        .font(.headline)
                }
                Section("Company") {
                    Text("\(user.company)")
                        .font(.headline)
                }
                Section("Email") {
                    Text("\(user.email)")
                        .font(.headline)
                }
                Section("Address") {
                    Text("\(user.address)")
                        .font(.headline)
                }
                Section("Registered") {
                    Text("\(user.registered)")
                        .font(.headline)
                }
                
                Section("About") {
                    Text("\(user.about)")
                        .font(.headline)
                }
                
                Section("Friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle("\(user.name)")
    }
}

#Preview {
    FriendDetailView(user: User.exampleUser)
}
