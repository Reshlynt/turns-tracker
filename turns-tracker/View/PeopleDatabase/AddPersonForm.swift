//
//  PersonRegisterPrompt.swift
//  turns-tracker
//
//  Created by Scott Do on 11/4/25.
//
// A sheet View to take in user input and create a Person object to store into the database.
// TODO: Take in user input. Allow them to confirm their choice. Save the result into SwiftData.

import SwiftUI
import SwiftData

struct AddPersonForm: View {
    
    // State variables
    @State private var name = ""
    
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
        }
        .toolbar {
            ToolbarItemGroup {
                Button("Add") {
                    let newPerson = Person(name: name)
                    name = ""
                    onAdd(newPerson)
                }
                .disabled(name.isEmpty)
                
                Button("Cancel") {
                    name = ""
                    onCancel()
                }
            }
        }
    }
}



#Preview {
    AddPersonForm(onAdd: { _ in } , onCancel: { } )
}
