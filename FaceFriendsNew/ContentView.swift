//
//  ContentView.swift
//  FaceFriendsNew
//
//  Created by Yordan Dimitrov on 05.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var friendsList: [User] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(friendsList, id: \.id) { friend in
                    HStack {
                        NavigationLink(value: friend) {
                            HStack {
                                Image(systemName: "octagon.fill")
                                    .foregroundStyle(friend.isActive ? .green : .red)
                                Text(friend.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("FaceFriends")
            .navigationDestination(for: User.self) { user in
                FriendDetailView(user: user)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async  {
        
        guard friendsList.isEmpty else { return }
        
        let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: endpoint) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let returnedData = try JSONDecoder().decode([User].self, from: data)
            friendsList = returnedData
        } catch {
            print("Invalid data")
        }
    }

}

#Preview {
    ContentView()
}
