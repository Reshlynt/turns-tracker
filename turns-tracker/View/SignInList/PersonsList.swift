//
//  PersonsList.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//

import SwiftUI
import SwiftData

struct PersonsList: View {
    
    // Loads persistent data storage space
    @Environment(\.modelContext) var modelContext
    
    // Asks code to go get this query of people.
    @Query var people: [Person]
    @State private var checkedPeople: [Person] = []
    
    // TODO: Consider this, each day a person signs in to the application and their name appears here. On day's end, this should be cleared empty, added once more based on who signs in first.
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(checkedPeople, id: \.self) { individual in
                    HStack {
                        PersonQuickInfo(person: individual)
                        PersonTaskRow(taskRow: individual.tasks)
                    }
                }
            }
        }
    }
}

#Preview {
    PersonsList()
        .modelContainer(for: Person.self, inMemory: true)
}
