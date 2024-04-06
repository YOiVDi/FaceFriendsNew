//
//  ContentView.swift
//  FaceFriendsNew
//
//  Created by Yordan Dimitrov on 05.04.24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.id) { friend in
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
                UserDetailView(user: user)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async  {
        
        guard users.isEmpty else { return }
        let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: endpoint) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let returnedData = try JSONDecoder().decode([User].self, from: data)
            
            let insertContext = ModelContext(modelContext.container)
            
            for user in returnedData {
                insertContext.insert(user)
            }
            
            try insertContext.save()
            
        } catch {
            print("Invalid data")
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
