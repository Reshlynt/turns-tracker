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
    
    
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: [Person.self, TaskAssignment.self, AppSettings.self])
        
        #if os(macOS)
        Settings {
            SettingsPage()
                .modelContainer(for: [AppSettings.self])
        }
        #endif
    }
}
