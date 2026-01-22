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
    
    // Attempt of two ModelContainers
    let mainContainer: ModelContainer
    
    init() {
        do {
            let config1 = ModelConfiguration("database1", schema: Schema([Person.self]) )
            let config2 = ModelConfiguration("database2", schema: Schema([TaskPerson.self]), isStoredInMemoryOnly: true )
            
            mainContainer = try ModelContainer(for: Person.self, configurations: config1, config2)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .modelContainer(mainContainer)
            }
        }
    }
}
