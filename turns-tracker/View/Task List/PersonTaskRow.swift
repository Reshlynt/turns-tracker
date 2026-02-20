//
//  PersonTaskRow.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//

// TODO: This struct showcases all tasks on the task row. This should be interactable in that the user can drag task into and out of this row. 

import SwiftUI

struct PersonTaskRow: View {
    
    @State var taskList: [TaskAssignment]
    
    let capsuleWidth: CGFloat = 55
    let capsuleHeight: CGFloat = 75
    let verticalInset: CGFloat = 10
    let horizontalInset: CGFloat = 16
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray)
                .frame(height: 90)
                .opacity(0.5)
                

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(taskList) { task in
                        TaskItem(taskItem: task)
                            .draggable(task)
                    }
                }
                .padding(.horizontal, horizontalInset)
                .padding(.vertical, verticalInset)
            }
            .frame(height: capsuleHeight + verticalInset * 2)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 12)
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

#Preview {
    let taskRowTest: [TaskAssignment] = [
        TaskAssignment(title: "task 1"),
        TaskAssignment(title: "task 2"),
        TaskAssignment(title: "task 3")
//        TaskAssignment(title: "task 4", order: 3),
//        TaskAssignment(title: "task 5", order: 4),
//        TaskAssignment(title: "task 6", order: 5),
//        TaskAssignment(title: "task 7", order: 6),
//        TaskAssignment(title: "task 8", order: 7)
    ]
    
    
    PersonTaskRow(taskList: taskRowTest)
}
