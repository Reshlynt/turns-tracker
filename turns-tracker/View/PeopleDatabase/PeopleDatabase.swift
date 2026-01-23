//
//  PeopleDatabase.swift
//  turns-tracker
//
//  Created by Scott Do on 10/28/25.
//

import SwiftUI
import SwiftData

// TODO: The intention of this view is to make a display of everyone that is currently in the database of people (in SwiftData), or workers in the sense. You must be able to add and remove people from this list. You must allow the showcase of their full information as kept in the database, including PIN.

struct PeopleDatabase: View {
    
    // TODO: Be able to add and remove people from this database and save the result.
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query var recordedPersons: [Person]
    
    // Status to store what people the user wants to delete.
    @State private var personToDelete: Person?
    
    // Add-sheet to add in people
    @State private var showingAddSheet = false
        
    var body: some View {
        List {
            ForEach(recordedPersons) { person in
                HStack {
                    Image("cat-meme")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                    
                    VStack {
                        Text(person.getName())
                            .font(.headline)
                        Text("PIN: " + person.pin)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                // Two fingers on the touchpad to delete.
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        delete(person)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        //.navigationTitle("Recorded persons")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showingAddSheet = true }) {
                    Label("Add", systemImage: "plus")
                }
            }
        }
        .alert(item: $personToDelete) { person in
            Alert(
                title: Text("Delete \"\(person.getName())\"?"),
                message: Text("This will permantly delete this person and any local data associated with it."),
                primaryButton: .destructive(Text("Delete")) {
                    delete(person)
                },
                secondaryButton: .cancel()
            )
        }
        .sheet(isPresented: $showingAddSheet) {
            // Here, the arguments here are the FUNCTIONS for onAdd and onCancel.
            AddPersonForm { newPerson in
                modelContext.insert(newPerson)
                showingAddSheet = false
            } onCancel: {
                showingAddSheet = false
            }
        }
    }
    
    
    private func delete (_ person: Person) {
        modelContext.delete(person)
    }
}



// The line for adding things into the database is {modelContext}.insert(student)

#Preview {
    PeopleDatabase()
        .modelContainer(for: [Person.self, TaskPerson.self])
}
