//
//  FaceFriendsNewApp.swift
//  FaceFriendsNew
//
//  Created by Yordan Dimitrov on 05.04.24.
//

import SwiftData
import SwiftUI

@main
struct FaceFriendsNewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: User.self)
        }
    }
}
