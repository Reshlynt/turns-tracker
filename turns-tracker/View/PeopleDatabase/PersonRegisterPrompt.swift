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
        Text("Enter the name of the person to register. A PIN will be automatically generated.")
        
        TextField("Name", text: $name)
        Button(action: {
            if !name.isEmpty {
                addPerson(name: name)
            }
        }, label: {
            Text("Save to database")
        })
    }
    
    private func addPerson(name: String) -> () {
        let newPerson = Person(name: name)
        modelContext.insert(newPerson)
        if modelContext.hasChanges {
            print("Yes, it has changes")
        }
        else {
            print("No, it does not have changes.")
        }
        do {
            try modelContext.save()
            print("model context saved")
        } catch {
            print(error.localizedDescription)
        }
        
    }
}



#Preview {
    PersonRegisterPrompt()
}
