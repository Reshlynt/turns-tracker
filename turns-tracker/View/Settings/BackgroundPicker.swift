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
    
    var onChooseBackground: (Data?) -> Void
    
    var body: some View {
        VStack {
            
            Section {
                if let testPic = DataToImageConverter.convertDataToImage(photoData: selectedPhotoData){
                    testPic
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
                    
                    Button {
                        onChooseBackground(selectedPhotoData)
                    } label: {
                        Label("Confirm Image", systemImage: "checkmark")
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
    BackgroundPicker(onChooseBackground: {_ in 
        
    }
    )
}
