//
//  TaskSelection.swift
//  turns-tracker
//
//  Created by Scott Do on 2/7/26.
//

import SwiftUI

struct TaskSelection: View {
    
    // Test data
    let taskRowTest: [TaskAssignment] = [
        TaskAssignment(title: "task 1", order: 0),
        TaskAssignment(title: "task 2", order: 1),
        TaskAssignment(title: "task 3", order: 2),
        TaskAssignment(title: "task 4", order: 3),
        TaskAssignment(title: "task 5", order: 4),
        TaskAssignment(title: "task 6", order: 5),
        TaskAssignment(title: "task 7", order: 6),
        TaskAssignment(title: "task 8", order: 7)
    ]
    
    var body: some View {
        Text("hello world")
        VStack {
            
        }
    }
}

#Preview {
    TaskSelection()
}


//ForEach(taskRowTest, id:  \.order) { task in
//    VStack {
//        Image(task.imageName)
//            .resizable()
//            .scaledToFit()
//            .frame(maxHeight: 60)
//        
//        Text(task.title)
//    }
//    .draggable(task)
//}
