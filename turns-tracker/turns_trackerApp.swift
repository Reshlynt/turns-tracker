//
//  turns_trackerApp.swift
//  turns-tracker
//
//  Created by Scott Do on 8/23/25.
//

import SwiftUI
import SwiftData

@main
struct turns_trackerApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                // your app's root view — ensure ContentView (or whatever) contains
                // navigation to PersonRegisterPrompt and PeopleDatabase, or embed them here
                ContentView()
            }
        }
        .modelContainer(for: [Person.self])
    }
}
