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
    
    
    var body: some View {
        // TODO: Create what a list of people in your app looks like. Then work out the details from there. Broad strokes, then refine it.
        
        ScrollView {
            VStack {
                // TODO: Each HStack here represents a person. This could be a row within itself.
                HStack {
                    
                // TODO: Each VStack here represents quick person information such as their image and their name.
                    VStack {
                        Image("cat-meme")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("jimbo")
                    }
                    .padding()
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(maxHeight: 100)
                        .opacity(0.6)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    PersonsList()
        .modelContainer(for: Person.self, inMemory: true)
}
