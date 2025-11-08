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
    @Query var people: [Person]
        
    var body: some View {
        VStack {
            List(people) { person in
                HStack {
                    Image("cat-meme")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Divider().padding()
                    Text(person.getName())
                    Divider().padding()
                    Text("PIN: " + person.pin)
                }
            }
            .navigationTitle("Recorded Persons")
            
            // What I want is the user to look for a button to add a person to this list. They will then be prompted with a form to add their name and their image.
        }
    }
    
}

// The line for adding things into the database is {modelContext}.insert(student)

#Preview {
    PeopleDatabase()
}
