//
//  PersonTaskRow.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//

// TODO: This struct showcases all tasks on the task row. This should be interactable in that the user can drag task into and out of this row. 

import SwiftUI

struct PersonTaskRow: View {
    
    @ObservedObject var taskRow: Taskrow
    
    // tweak these values to control sizes and spacing
        let capsuleWidth: CGFloat = 55
        let capsuleHeight: CGFloat = 75
        let verticalInset: CGFloat = 10
        let horizontalInset: CGFloat = 16
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray)
                .frame(height: 80)
                .opacity(0.5)

            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(taskRow.taskList, id: \.order) { task in
                        VStack {
                            Image(task.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: capsuleWidth * 0.7,
                                       height: capsuleHeight * 0.5,
                                       alignment: .top)
                                .clipped()
                            Text(task.title)
                        }
                        .background(
                            Capsule()
                                .fill(.blue)
                                .frame(width: capsuleWidth, height: capsuleHeight)
                        )
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
        TaskAssignment(title: "task 1", order: 0),
        TaskAssignment(title: "task 2", order: 1),
        TaskAssignment(title: "task 3", order: 2)
//        TaskAssignment(title: "task 4", order: 3),
//        TaskAssignment(title: "task 5", order: 4),
//        TaskAssignment(title: "task 6", order: 5),
//        TaskAssignment(title: "task 7", order: 6),
//        TaskAssignment(title: "task 8", order: 7)
    ]
    
    let t = Taskrow(taskList: taskRowTest)
    
    PersonTaskRow(taskRow: t)
}
