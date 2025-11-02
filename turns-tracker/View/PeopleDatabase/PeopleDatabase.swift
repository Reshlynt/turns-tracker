//
//  PeopleDatabase.swift
//  turns-tracker
//
//  Created by Scott Do on 10/28/25.
//

import SwiftUI

// TODO: The intention of this view is to make a display of everyone that is currently in the database of people, or workers in the sense. You must be able to add and remove people from this list. You must allow the showcase of their full information as kept in the database, including PIN.

struct PeopleDatabase: View {
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PeopleDatabase()
        .modelContainer(for: Person.self, inMemory: true)
}
