//
//  PersonTurnRow.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//
// Each is a row that presents a person and what tasks they are to do

import SwiftUI

struct PersonTurnRow: View {
    @Environment(ModelData.self) var modelData
    
    // Setup variables
    var person: Person
    
    @State private var isTargeted: Bool = false
    
    var body: some View {
        
        // Current error: cannot drag anything into the boxes. Perhaps it must be that I am failing to write code properly.
        @Bindable var modelData = modelData
        HStack {
            // Shows a brief person information showcase
            QuickPersonInfo(person: person)
            
            // Scrollable task row for dragging
            TurnRow()
                .dropDestination(for: TaskAssignment.self) { droppedTasks, location in
                    
                    TurnRow().addTask(task: droppedTasks)
                    
                    return true
                } isTargeted: { Bool in
                    
                }
        }
    }
}

#Preview {
    
    let modelData = ModelData()
    return PersonTurnRow(person: modelData.personList[0])
        .environment(modelData)
}
