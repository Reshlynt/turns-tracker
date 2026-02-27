//
//  TaskCreateForm.swift
//  turns-tracker
//
//  Created by Scott Do on 2/27/26.
//

import SwiftUI

struct TaskCreateForm: View {
    
    @State var taskName: String
    
    // Callbacks
    var onAdd: (TaskAssignment) -> Void
    var onCancel: () -> ()
    
    var body: some View {
        VStack {
            //TODO: Allow the user to pick a picture
            
            
            
            TextField("Name", text: $taskName, prompt: Text("my task"))
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
}

#Preview {
    TaskCreateForm(taskName: "") {_ in 
        
    } onCancel: {
        
    }
}
