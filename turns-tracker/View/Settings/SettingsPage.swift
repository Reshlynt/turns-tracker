//
//  SettingsPage.swift
//  turns-tracker
//
//  Created by Scott Do on 3/29/26.
//

import SwiftUI
import PhotosUI

struct SettingsPage: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    var body: some View {
        VStack {
            PhotosPicker("Select image", selection: $avatarItem, matching: .images)
            
            
            avatarImage?
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        }
        .onChange(of: avatarItem) {
            Task {
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                } else {
                    print("Failed operation")
                }
            }
        }
    }
}

#Preview {
    SettingsPage()
}
