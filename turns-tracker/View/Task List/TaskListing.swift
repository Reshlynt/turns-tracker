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
        GridItem(.flexible(minimum: 40), spacing: spacing),
        GridItem(.flexible(minimum: 40), spacing: spacing)
    ]
    static let spacing: CGFloat = 25
    
    // Test data
    let taskListing: [TaskAssignment] = [
        TaskAssignment(title: "do this"),
        TaskAssignment(title: "do that"),
        TaskAssignment(title: "maybe that"),
        TaskAssignment(title: "also this")
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 15) {
                ForEach(taskListing) { t in
                    TaskItem(taskItem: t)
                        .draggable(t)
                }
            }
        }
    }
}

#Preview {
    TaskListing()
}
