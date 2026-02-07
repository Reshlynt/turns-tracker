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
    
    // Keeps a consistent sign in view model
    @StateObject private var signInVM = SignInViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(signInVM: signInVM)
        }
        .modelContainer(for: [Person.self])
    }
}
