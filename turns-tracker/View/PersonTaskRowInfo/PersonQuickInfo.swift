//
//  PersonQuickInfo.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//

// TODO: This struct operates as dividing sections and views into smaller structs for easier readibility and comprehension for the coder. This struct in particular is meant to show a person's picture and name.

import SwiftUI

struct PersonQuickInfo: View {
    
    var person: Person
    
    var body: some View {
        VStack {
            // TODO: Figure out how to get an image of a person. Basically a profile picture. Currently it has only a placeholder of cat-meme but it needs to be replaced later.
            Image("cat-meme")
                .resizable()
                .frame(width: 50, height: 50)
            Text(person.getName())
        }
        .padding()
    }
}

#Preview {
    let person = Person(name: "Davey")
    PersonQuickInfo(person: person)
}
