//
//  QuickPersonInfo.swift
//  turns-tracker
//
//  Created by Scott Do on 9/13/25.
//

import SwiftUI

struct QuickPersonInfo: View {
    @Environment(ModelData.self) var modelData
    
    // Setup
    var person: Person
    
    var body: some View {
        @Bindable var modelData = modelData
        // Shows a brief person information showcase
        VStack {
            person.getPhoto()!
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            Text(person.name)
        }
        .padding()
    }
}

#Preview {
    let modelData = ModelData()
    return QuickPersonInfo(person: modelData.personList[0])
        .environment(modelData)
}
