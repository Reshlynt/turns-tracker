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
    @State private var showPriceChange = false
    
    @State private var priceChange = ""
    
    // Delete all state
    @State private var deleteAllWarning = false
    @State var showInvalidDecimal = false
        
    var body: some View {
        VStack {
            List {
                ForEach(recordedPersons) { person in
                    
                    PersonDatabaseInfo(person: person)
                    .background {
                        RoundedRectangle(cornerRadius: 20.0)
                            .opacity(0.80)
                    }
                    // Two fingers on the touchpad to delete.
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            deletePerson(person)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .contextMenu {
                        //TODO: Present a menu to allow the user to change the pay as needed.
                        Button("Change pay") {
                            showPriceChange = true
                        }
                    }
                    .sheet(isPresented: $showPriceChange) {
                        VStack {
                            Text("Insert new pay. Decimal inputs accepted only.")
                            if (showInvalidDecimal) {
                                Text("Invalid input.")
                            }
                            TextField("Name", text: $priceChange, prompt: Text("Change pay"))
                            //TODO: Buttons need actions to do something
                            HStack {
                                Button("Confirm") {
                                    if let strToDecimal = Decimal(string: priceChange, locale: Locale.current) {
                                        person.payRate = strToDecimal
                                        showInvalidDecimal = false
                                        showPriceChange = false
                                    } else {
                                        showInvalidDecimal = true
                                        print("Invalid decimal format")
                                    }
                                    
                                }
                                Button("Cancel") {
                                    showPriceChange = false
                                }
                            }
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
        .scrollContentBackground(.hidden)
        
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
    
    /// Given a person, change its pay.
    private func changePay(_ person: Person) {
        
    }
}

#Preview {
    PeopleDatabase()
        .modelContainer(for: [Person.self], inMemory: true)
}
