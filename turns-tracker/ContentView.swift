//
//  ContentView.swift
//  turns-tracker
//
//  Created by Scott Do on 8/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var items: [Item]

    var body: some View {

    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
