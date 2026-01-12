//
//  PersonRegisterPrompt.swift
//  turns-tracker
//
//  Created by Scott Do on 11/4/25.
//
// TODO: Take in user input. Allow them to confirm their choice. Save the result into SwiftData.

import SwiftUI
import SwiftData

struct AddPersonForm: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    
    var onAdd: (Person) -> Void
    var onCancel: () -> Void
    
    var body: some View {
            Form {
                TextField("Name", text: $name)
            }
            .navigationTitle("New Person")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newPerson = Person(name: name)
                        onAdd(newPerson)
                        dismiss()
                    }.disabled(name.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onCancel()
                        dismiss()
                    }
                }
            }
    }
}


#Preview {
    AddPersonForm(
        onAdd: { _ in },
        onCancel: { }
    )
}
