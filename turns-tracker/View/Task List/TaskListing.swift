//
//  TaskListing.swift
//  turns-tracker
//
//  Created by Scott Do on 2/12/26.
//

import SwiftUI



struct TaskListing: View {
    
    // Layout variables
    let layout = [
        GridItem(.flexible(minimum: 40), spacing: Self.spacing),
        GridItem(.flexible(minimum: 40), spacing: Self.spacing)
    ]

    @State private var droppedTasks: [TaskAssignment] = []
    @State private var isTargeted = false
    @State private var isHovering = false

    static let spacing: CGFloat = 25
    
    // Test data
    let taskListing: [TaskAssignment] = [
        TaskAssignment(title: "do this"),
        TaskAssignment(title: "do that"),
        TaskAssignment(title: "maybe that"),
        TaskAssignment(title: "also this")
    ]
    
    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 15) {
                    ForEach(taskListing) { t in
                        TaskItem(taskItem: t)
                            .draggable(t)
                    }
                }
            }
        }
        .frame(width: 200)
    }
}

#Preview {
    TaskListing()
}
