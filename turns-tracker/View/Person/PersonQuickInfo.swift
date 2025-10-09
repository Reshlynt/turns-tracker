//
//  PersonQuickInfo.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//

import SwiftUI

struct PersonQuickInfo: View {
    
    var person: Person
    
    var body: some View {
        VStack {
            // TODO: Figure out how to get an image of a person. Basically a profile picture.
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
