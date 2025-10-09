//
//  ContentView.swift
//  turns-tracker
//
//  Created by Scott Do on 8/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    // Loads persistent data storage space
//    @Environment(\.modelContext) var modelContext
//    
//    // Asks code to go get this query of people.
//    @Query var people: [Person]
    var body: some View {
        PersonsList()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Person.self, inMemory: true)
}
