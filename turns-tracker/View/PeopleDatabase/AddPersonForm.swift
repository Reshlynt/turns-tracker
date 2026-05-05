//
//  PersonRegisterPrompt.swift
//  turns-tracker
//
//  Created by Scott Do on 11/4/25.
//
// A sheet View to take in user input and create a Person object to store into the database.

import SwiftUI
import SwiftData
import PhotosUI

struct AddPersonForm: View {
    
    // State variables
    @State private var name = ""
    @State private var backgroundPhoto: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    // Function variables
    var onAdd: (Person) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Text("Enter name to register.")
                .font(.largeTitle)
            Text("A PIN will be automatically generated.")
                .font(.caption)
            TextField("Name", text: $name, prompt: Text("John Doe"))
                .padding()
            
            //TODO: Allow the user to assign the Person an Image.
            PhotosPicker(selection: $backgroundPhoto,
                         matching: .images,
                         photoLibrary: .shared()) {
                Label("Assign Profile Picture", systemImage: "photo")
            }
            
            if let testPic = DataToImageConverter.convertDataToImage(photoData: selectedPhotoData){
                testPic
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 200)
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
        .toolbar {
            ToolbarItemGroup {
                Button("Add") {
                    let newPerson = Person(name: name, profilePictureData: selectedPhotoData)
                    name = ""
                    onAdd(newPerson)
                }
                .disabled(name.isEmpty)
                .keyboardShortcut(.defaultAction)
                
                Button(role: .cancel) {
                    name = ""
                    onCancel()
                } label: {
                    Text("Cancel")
                }
                .keyboardShortcut(.cancelAction)
            }
        }
    }
}



#Preview {
    AddPersonForm(onAdd: { _ in } , onCancel: { } )
}
