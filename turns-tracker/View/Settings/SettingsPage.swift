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
    @Query(filter: #Predicate<AppSettings> { $0.id == "app-settings" })
    private var settingsArray: [AppSettings]
    
    var settings: AppSettings {
        settingsArray[0]
    }
    
    
    var body: some View {
        if #available(macOS 15.0, *) {

            TabView {
                BackgroundPicker() { photoData in
                    settings.image = photoData
                    saveAppSettings()
                }
                .tabItem {
                    Label("Background", systemImage: "photo.fill")
                }
                
                PicPresentTest()
                    .tabItem {
                        Label("test", systemImage: "checkmark")
                    }
            }
            .frame(minWidth: 500, minHeight: 600)
        } else {
            // Fallback on earlier versions
        }
        
        if let testPic = DataToImageConverter.convertDataToImage(photoData: settings.image) {
            testPic
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 200)
        }

    }
    
    private func saveAppSettings() {
        do {
            try modelContext.save()
            print("Save successful")
        } catch {
            print(error)
        }
    }
}

#Preview {
    SettingsPage()
        .modelContainer(for: [AppSettings.self], inMemory: true)
}
