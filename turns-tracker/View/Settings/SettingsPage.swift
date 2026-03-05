//
//  SettingsPage.swift
//  turns-tracker
//
//  Created by Scott Do on 3/4/26.
//

import SwiftUI
import SwiftData
import AppKit

struct SettingsPage: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var settingsArray: [AppSettings]
    
    @State private var previewImage: NSImage?
    
    var settings: AppSettings {
        settingsArray.first ?? AppSettings()
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Background Image")
                    .font(.headline)
                
                // Image preview
                if let image = previewImage {
                    Image(nsImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .border(Color.gray, width: 1)
                } else if !settings.backgroundImagePath.isEmpty,
                          let image = NSImage(contentsOfFile: settings.backgroundImagePath) {
                    Image(nsImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .border(Color.gray, width: 1)
                } else {
                    VStack {
                        Image(systemName: "photo")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        Text("No image selected")
                            .foregroundColor(.gray)
                    }
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .border(Color.gray, width: 1)
                }
                
                HStack(spacing: 12) {
                    Button(action: pickBackgroundImage) {
                        Label("Choose Image", systemImage: "photo")
                    }
                    
                    if !settings.backgroundImagePath.isEmpty {
                        Button(role: .destructive, action: removeBackgroundImage) {
                            Label("Remove", systemImage: "trash")
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .onAppear {
            loadPreview()
        }
    }
    
    // MARK: - Helper Methods
    private func pickBackgroundImage() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.image]
        panel.allowsMultipleSelection = false
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        
        panel.begin { response in
            if response == .OK, let url = panel.url {
                // Copy image to Documents folder
                let fileManager = FileManager.default
                let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let fileName = "bg-" + UUID().uuidString + (url.pathExtension.isEmpty ? "" : "." + url.pathExtension)
                let destinationURL = documentsURL.appendingPathComponent(fileName)
                
                do {
                    try fileManager.copyItem(at: url, to: destinationURL)
                    settings.backgroundImagePath = destinationURL.path
                    try modelContext.save()
                    previewImage = NSImage(contentsOfFile: destinationURL.path)
                } catch {
                    print("Error copying background image: \(error)")
                }
            }
        }
    }
    
    private func removeBackgroundImage() {
        let fileManager = FileManager.default
        
        if !settings.backgroundImagePath.isEmpty,
           fileManager.fileExists(atPath: settings.backgroundImagePath) {
            do {
                try fileManager.removeItem(atPath: settings.backgroundImagePath)
            } catch {
                print("Error removing background image: \(error)")
            }
        }
        
        settings.backgroundImagePath = ""
        try? modelContext.save()
        previewImage = nil
    }
    
    private func loadPreview() {
        if !settings.backgroundImagePath.isEmpty {
            previewImage = NSImage(contentsOfFile: settings.backgroundImagePath)
        }
    }
}

#Preview {
    SettingsPage()
        .modelContainer(for: AppSettings.self, inMemory: true)
}
