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
            if let testPic = DataToImageConverter.convertDataToImage(photoData: person.profilePictureData){
                testPic
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
            }
            Text(person.name)
        }
        .padding()
    }
}

#Preview {
    let person = Person(name: "Davey")
    PersonQuickInfo(person: person)
}
