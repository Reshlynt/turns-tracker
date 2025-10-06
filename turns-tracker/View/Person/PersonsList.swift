//
//  PersonsList.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//
//  This View serves to present people in a list.

import SwiftUI

struct PersonsList: View {
    @Environment(ModelData.self) var modelData
    var peopleList: [Person] {
        return modelData.personList
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        VStack {
            ForEach(peopleList) { worker in
                PersonTurnRow(person: worker)
            }
        }
        
    }
}

#Preview {
    PersonsList()
        .environment(ModelData())
}
