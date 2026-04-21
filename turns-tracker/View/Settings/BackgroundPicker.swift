//
//  BackgroundPicker.swift
//  turns-tracker
//
//  Created by Scott Do on 4/20/26.
//

import SwiftUI
import SwiftData
import PhotosUI

struct BackgroundPicker: View {
    
    @State private var backgroundPhoto: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    private var previewImage: Image? {
            guard
                let selectedPhotoData,
                let nsImage = NSImage(data: selectedPhotoData)
            else {
                return nil
            }

            return Image(nsImage: nsImage)
        }

    
    var body: some View {
        VStack {
            
            Section {
                if let previewImage {
                    previewImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300, maxHeight: 200)
                }
                
                PhotosPicker(selection: $backgroundPhoto,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Label("Add Image", systemImage: "photo")
                }
                
                if selectedPhotoData != nil {
                    Button(role: .destructive) {
                        withAnimation {
                            backgroundPhoto = nil
                            selectedPhotoData = nil
                        }
                    } label: {
                        Label("Remove Image", systemImage: "xmark")
                            .foregroundStyle(.red)
                    }
                }
            }
            .task(id: backgroundPhoto) {
                if let data = try? await backgroundPhoto?.loadTransferable(type: Data.self) {
                    selectedPhotoData = data
                }
            }
            
            
        }
    }
}

#Preview {
    BackgroundPicker()
}
