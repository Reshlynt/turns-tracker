//
//  TaskListing.swift
//  turns-tracker
//
//  Created by Scott Do on 2/12/26.
//

import SwiftUI
import SwiftData

struct TaskListing: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var taskListing: [TaskAssignment]
    
    // Layout variables
    let layout = [
        GridItem(.flexible(minimum: 40), spacing: Self.spacing),
        GridItem(.flexible(minimum: 40), spacing: Self.spacing)
    ]

    @State private var droppedTasks: [TaskAssignment] = []
    @State private var isTargeted = false
    @State private var isHovering = false

    static let spacing: CGFloat = 25
    
    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 15) {
                    ForEach(taskListing) { t in
                        TaskItem(taskItem: t) {
                            deleteTask(t)
                        }
                        .draggable(t)
                    }
                }
            }
        }
        .frame(width: 200)
        .contextMenu {
            Button("Create a task") {
                //TODO: Create task
                
            }
        }
    }
    
    // MARK: - Helper Functions
    private func deleteTask(_ task: TaskAssignment) {
        modelContext.delete(task)
        try? modelContext.save()
    }
}

#Preview {
    TaskListing()
}
