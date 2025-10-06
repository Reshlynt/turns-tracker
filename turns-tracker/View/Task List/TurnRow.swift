//
//  TurnRow.swift
//  turns-tracker
//
//  Created by Scott Do on 10/1/25.
//
//  This is a representation of all tasks in a row assigned to a person.

import SwiftUI

struct TurnRow: View {
    @State private var turnList: [TaskAssignment] = []
    var targeted: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.25)
                .frame(maxHeight: 65)
            
            ScrollView(.horizontal) {
                HStack (spacing: 20) {
                    ForEach(turnList) { assignment in
                        assignment.getIcon()!
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .draggable(assignment)
                    }
                }
            }
        }
        .padding()
    }
    /// Adds a dragged task into the task list row
    /// - Parameter task: A draggable Task array object.
    /// - Returns: Nothing
    func addTask(task: [TaskAssignment]) -> Void {
        turnList += task
    }
}

#Preview {
    TurnRow()
}
