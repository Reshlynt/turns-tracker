//
//  PersonTaskRow.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//

// TODO: This struct showcases all tasks on the task row. This should be interactable in that the user can drag task into and out of this row. 

import SwiftUI

struct PersonTaskRow: View {
    
    @State var taskRow: [Task]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray)
                .frame(height: 80)
                .opacity(0.5)

            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(taskRow, id: \.order) { task in
                        VStack {
                            Image(task.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 60)
                            
                            Text(task.title)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
            .frame(height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 12)
        }
        .padding(.vertical, 6)
        .padding(.horizontal)
    }
}

#Preview {
    let taskRowTest: [Task] = [
        Task(title: "task 1", order: 0),
        Task(title: "task 2", order: 1),
        Task(title: "task 3", order: 2),
        Task(title: "task 4", order: 3),
        Task(title: "task 5", order: 4),
        Task(title: "task 6", order: 5),
        Task(title: "task 7", order: 6),
        Task(title: "task 8", order: 7)
    ]
    
    PersonTaskRow(taskRow: taskRowTest)
}
