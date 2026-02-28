//
//  TaskCreateForm.swift
//  turns-tracker
//
//  Created by Scott Do on 2/27/26.
//

import SwiftUI
import AppKit

struct TaskCreateForm: View {
    
    @State var taskName: String = ""
    @State private var selectImagePath: String = "cat-meme"
    @State private var selectImageName: String = "cat-meme"
    
    // Callbacks
    var onAdd: (TaskAssignment) -> Void
    var onCancel: () -> ()
    
    var body: some View {
        VStack {
            //TODO: Allow the user to pick a picture
            if let nsImage = NSImage(contentsOfFile: selectImagePath) {
                Image(nsImage: nsImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding()
                    .border(Color.gray, width: 1)
            } else {
                VStack {
                    Image(selectImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding()
                }
                .border(Color.gray, width: 1)
            }
            
            Button(action: pickImage) {
                Label("Assign Image", systemImage: "photo")
            }
            
            
            TextField("Name", text: $taskName, prompt: Text("Name your task"))
                .padding()
        }
        .toolbar {
            ToolbarItemGroup {
                Button("Add") {
                    let newTask = TaskAssignment(title: taskName)
                    taskName = ""
                    onAdd(newTask)
                }
                .disabled(taskName.isEmpty)
                .keyboardShortcut(.defaultAction)
                
                Button(role: .cancel) {
                    taskName = ""
                    onCancel()
                } label: {
                    Text("Cancel")
                }
                .keyboardShortcut(.cancelAction)
            }
        }
    }
    
    // MARK: -  Helper Functions
    private func pickImage() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.image]
        panel.allowsMultipleSelection = false
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        
        panel.begin { response in
            if response == .OK, let url = panel.url {
                // Copy the image to app's Documents folder
                let fileManager = FileManager.default
                let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let fileName = url.lastPathComponent
                let destinationURL = documentsURL.appendingPathComponent(fileName)
                
                do {
                    // Remove existing file if it exists
                    if fileManager.fileExists(atPath: destinationURL.path) {
                        try fileManager.removeItem(at: destinationURL)
                    }
                    // Copy the new file
                    try fileManager.copyItem(at: url, to: destinationURL)
                    selectImagePath = destinationURL.path
                    selectImageName = fileName
                } catch {
                    print("Error copying image: \(error)")
                }
            }
        }
    }
}

#Preview {
    TaskCreateForm(taskName: "") {_ in 
        
    } onCancel: {
        
    }
}
