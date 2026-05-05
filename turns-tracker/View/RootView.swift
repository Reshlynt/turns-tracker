//
//  RootView.swift
//  turns-tracker
//
//  Created by Scott Do on 4/27/26.
//
// The function of RootView is to begin the setup of most functions needed prior before running the application proper for the user.

import SwiftUI
import SwiftData

struct RootView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<AppSettings> { $0.id == "app-settings" })
    private var settingsArray: [AppSettings]
    
    @StateObject private var signInVM = SignInViewModel()
    
    var body: some View {
        ContentView(signInVM: signInVM)
            .onAppear {
                bootstrapSettings()
            }
    }
    
    private func bootstrapSettings() {
        print("gamer")
        // if the settingsArray is NOT empty, then return
        if !settingsArray.isEmpty {
            return
        }
        
        let settings = AppSettings()
        modelContext.insert(settings)
        
        do {
            try modelContext.save()
            
        } catch {
            print("Falled to create AppSettings: ", error)
        }
    }
}

#Preview {
    RootView()
        .modelContainer(for: [Person.self, TaskAssignment.self, AppSettings.self], inMemory: true)
}
