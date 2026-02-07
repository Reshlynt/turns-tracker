//
//  SignInForm.swift
//  turns-tracker
//
//  Created by Scott Do on 2/2/26.
//
// This code prompts the user to type in a 6-digit PIN and either confirm the sign in the user or cancel to forgo the operation.

import SwiftUI
import SwiftData

struct SignInForm: View {
    
    // Environment variables
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Query private var database: [Person]
    
    // State variables
    @State private var pin: String = ""
    @State private var showAlert = false
    
    // Variable functions
    let onAdd: (Person) -> ()
    let onCancel: () -> ()
    
    var body: some View {
        VStack {
            Form {
                VStack {
                    Text("Enter PIN below to sign in.")
                        .font(.largeTitle)
                    TextField("PIN", text: $pin, prompt: Text("012345"))
                        .padding()
                }
                .toolbar {
                    ToolbarItem {
                        Button("Confirm") {
                            guard let person = checkPIN(pin: pin) else {
                                showAlert = true
                                return
                            }
                            onAdd(person)
                        }
                        
                        .alert("Invalid PIN", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    }
                    ToolbarItem {
                        Button("Cancel") {
                            //TODO: Create function to cancel operation
                            pin = ""
                            onCancel()
                        }
                    }
                }
               
            }
            
            
        }
    }
    
    // Finds the person with the corresponding PIN
    private func checkPIN(pin: String) -> Person? {
        
        // If the PIN sent is invalid, return.
        let trimmed = pin.trimmingCharacters(in: .whitespacesAndNewlines)
            // require exactly 6 digits
        guard trimmed.count == 6, trimmed.allSatisfy(\.isNumber) else { return nil }
        
        // Check if the pin exists in the database
        for person in database {
            if person.pin == pin {
                return person
            }
        }
        return nil
    }
}

#Preview {
    SignInForm() { person in
        
    } onCancel: {
        
    }

}
