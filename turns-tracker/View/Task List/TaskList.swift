//
//  TaskList.swift
//  turns-tracker
//
//  Created by Scott Do on 9/29/25.
//
//  TaskList provides a view of TaskAssignment

import SwiftUI

// Dummy data


struct TaskList: View {
    @Environment(ModelData.self) var modelData
    @State var droppedListTest: [String] = []
    
    // Grid management
    @State private var index: Int = 0
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // Struct arguments
    var taskList: [TaskAssignment] {
        return modelData.taskAssignmentList
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        // I will need two columns, and as many rows as needed to populate the list, and the space is flexible in this space. It will have to keep an index to cycle through a list of TaskAssignments.
        VStack {
            Text("Assignment List")
                .font(.title)
                .padding()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(taskList, id: \.self) { item in
                        item.getIcon()!
                            .resizable()
                            .scaledToFit()
                            .draggable(item)
                    }
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    let modelData = ModelData()
    TaskList()
        .environment(modelData)
}
