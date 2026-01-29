////
////  SignInPrompt.swift
////  turns-tracker
////
////  Created by Scott Do on 1/7/26.
////
//
//import SwiftUI
//import SwiftData
//
//struct SignInPrompt: View {
//    @Environment(\.modelContext) var modelContext
//    @Environment(\.dismiss) private var dismiss
//    
//    @Query var recordedPersons: [Person]
//    
//    @State private var pin = ""
//    @State private var personToSearch: TaskPerson? = nil
//    
//    // Functions to be used by SignInList
//    var onAdd: (TaskPerson) -> Void
//    var onCancel: () -> Void
//    
//    var body: some View {
//            Form {
//                TextField("PIN", text: $pin)
//            }
//            .navigationTitle("Enter PIN")
//            .toolbar {
//                ToolbarItem (placement: .confirmationAction) {
//                    Button("Sign in") {
//                        
//                        if findPersonByPin(pin: pin) {
//                            print("yes")
//                            onAdd(personToSearch!)
//                        } else {
//                            print("no")
//                        }
//                        
//                        dismiss()
//                    }.disabled(pin.isEmpty || pin.count > 6)
//                }
//                ToolbarItem (placement: .cancellationAction) {
//                    Button("Cancel") {
//                        onCancel()
//                        dismiss()
//                    }
//                }
//            }
//    }
//    
//    // This function finds a person from the People Database stored in SwiftData
//    private func findPersonByPin(pin: String) -> (Bool) {
//        // First, reset the result to ensure that you don't bring the last one in
//        
//        personToSearch = nil
//        
//        // Second, check for if there is a pin. If there is not a vaild PIN, return false.
//        if (pin.count != 6 || pin.isEmpty) {
//            return false
//        }
//        
//        // If conditions are true, loop through the database to find the right person, and then create a TaskPerson.
//        
//        var foundPerson: Person? = nil
//        for person in recordedPersons {
//            if pin == person.pin {
//                foundPerson = person
//                break
//            }
//        }
//        
//        // Check if there is a result. If the person is not found, return false.
//        if foundPerson == nil {
//            return false
//        } else {
//            personToSearch = TaskPerson(associatedPerson: foundPerson!)
//            return true
//        }
//    }
//}
//
//#Preview {
//    //SignInPrompt()
//    SignInPrompt { _ in
//        
//        
//        
//    } onCancel: {
//        
//    }
//}
