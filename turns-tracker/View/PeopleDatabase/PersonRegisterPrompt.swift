//
//  PersonRegisterPrompt.swift
//  turns-tracker
//
//  Created by Scott Do on 11/4/25.
//

// TODO: Take in user input. Allow them to confirm their choice. Save the result into SwiftData.

import SwiftUI
import SwiftData

struct PersonRegisterPrompt: View {
    
    @Environment(\.modelContext) var modelContext
    
    // TODO: This is where you would assign a picture of the person. Discern how to prompt for that.
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            Text("Enter the name of the person to register. A PIN will be automatically generated.")
            
            
            TextField("Name", text: $name)
            Button(action: {
                if !name.isEmpty {
                    if addPerson(name: name) {
                        print("save successful")
                    } else {
                        print("save failed")
                    }
                    name = ""
                } else {
                    print("name empty")
                }
            }, label: {
                Text("Save to database")
            })
        }
        .navigationTitle("Register a person")
    }
    
    private func addPerson(name: String) -> Bool {
        let newPerson = Person(name: name)
        modelContext.insert(newPerson)
        do {
            try modelContext.save()
            // persist changes to the container
            print("model context saved")
            return true
        } catch {
            print("Failed to save modelContext:", error.localizedDescription)
            return false
        }
        
    }
}



#Preview {
    PersonRegisterPrompt()
}
