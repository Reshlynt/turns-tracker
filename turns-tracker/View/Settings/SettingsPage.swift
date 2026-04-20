//
//  SettingsPage.swift
//  turns-tracker
//
//  Created by Scott Do on 3/29/26.
//

// TODO: I have a avatarImage

import SwiftUI
import PhotosUI
import SwiftData

struct SettingsPage: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var settingsArray: [AppSettings]
    
    var settings: AppSettings {
        settingsArray.first ?? AppSettings()
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: BackgroundPicker()) {
                    Label("Background", systemImage: "photo")
                }
            }
        } detail: {
            
        }

    }
}

#Preview {
    SettingsPage()
}
