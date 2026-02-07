//
//  PeopleDatabase.swift
//  turns-tracker
//
//  Created on 10/28/25.
//
// Keeps a database of all people that have been registered into this platform.

import SwiftUI
import SwiftData

struct PeopleDatabase: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recordedPersons: [Person]
    
    // Add-sheet to add in people
    @State private var showingAddSheet = false
    
    // Delete all state
    @State private var deleteAllWarning = false
        
    var body: some View {
        VStack {
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
                            Text(person.name)
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
                            deletePerson(person)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Database of Recorded Persons")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {showingAddSheet = true } ) {
                        Label("Add", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button(action: { deleteAllWarning = true } ) {
                        Label("Delete all", systemImage: "trash")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                // TODO: Redo AddPersonForm.
                AddPersonForm { person in
                    addPerson(person)
                    showingAddSheet = false
                } onCancel: {
                    showingAddSheet = false
                }
            }
            .alert("Delete all registered persons?", isPresented: $deleteAllWarning) {
                Button(role: .destructive) {
                    do {
                        try modelContext.delete(model: Person.self)
                        try modelContext.save()
                        deleteAllWarning = false
                        print("Deletion success!")
                    } catch {
                        print("Error at batch deletion: ", error)
                    }
                } label: {
                    Text("Delete All")
                }
                
                Button(role: .cancel) {
                    deleteAllWarning = false
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
    
    // MARK: Helper functions
    /// Given a Person, delete that object from the Model Data.
    private func deletePerson(_ person: Person) {
        do {
            modelContext.delete(person)
            try modelContext.save()
        } catch {
            print(error)
        }
    }
    
    /// Given a Person, add that object into the Model Data
    private func addPerson(_ person: Person) {
        do {
            modelContext.insert(person)
            try modelContext.save()
        } catch {
            print(error)
        }
    }
}

#Preview {
    PeopleDatabase()
        .modelContainer(for: [Person.self], inMemory: true)
}
