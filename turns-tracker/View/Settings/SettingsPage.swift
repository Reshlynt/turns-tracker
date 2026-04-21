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
        if #available(macOS 15.0, *) {
            TabView {
                BackgroundPicker()
                    .tabItem {
                        Label("Background", systemImage: "photo.fill")
                    }

            }
            .frame(minWidth: 500, minHeight: 600)
        } else {
            // Fallback on earlier versions
        }

    }
}

#Preview {
    SettingsPage()
}
