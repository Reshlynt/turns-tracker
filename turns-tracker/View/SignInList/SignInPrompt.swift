//
//  SignInPrompt.swift
//  turns-tracker
//
//  Created by Scott Do on 1/7/26.
//

import SwiftUI
import SwiftData

struct SignInPrompt: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Query var recordedPersons: [Person]
    
    @State private var pin = ""
    @State private var personToSearch: Person? = nil
    
    // Functions to be used by SignInList
    var onAdd: (Person) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("PIN", text: $pin)
            }
            .navigationTitle("Enter PIN")
            .toolbar {
                ToolbarItem (placement: .confirmationAction) {
                    Button("Sign in") {
                        
                        personToSearch = findPersonByPin(pin: pin)
                        
                        // The goal is to find the person with the correct PIN identical to one produced by the user.
                        onAdd(personToSearch!)
                        dismiss()
                    }.disabled(pin.isEmpty || pin.count > 6)
                }
                ToolbarItem (placement: .cancellationAction) {
                    Button("Cancel") {
                        onCancel()
                        dismiss()
                    }
                }
            }
        }
    }
    
    // This function finds a person from the People Database stored in SwiftData
    private func findPersonByPin(pin: String) -> (Person) {
        // PIN should be a "numerical value and does not need to be capitalized or lower-cased. It is comparing if either of the two are identical.
        
        var personToSend: Person? = nil
        
        // Check for possible errors
        if (pin.isEmpty || pin.count > 6) {
            return personToSend!
        }
        
        for person in recordedPersons {
            if pin == person.pin {
                personToSend = person
                break
            }
        }
        
        return personToSend!
    }
}

#Preview {
    //SignInPrompt()
    SignInPrompt { _ in
        
        
        
    } onCancel: {
        
    }
}
