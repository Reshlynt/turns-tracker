//
//  TaskItem.swift
//  turns-tracker
//
//  Created by Scott Do on 2/10/26.
//

import SwiftUI

struct TaskItem: View {
    
    let taskItem: TaskAssignment
    
    var body: some View {
        VStack {
            Image(taskItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 60)
            
            Text(taskItem.title)
        }
    }
}

#Preview {
    let test = TaskAssignment(title: "task", imageName: "cat-meme")
    TaskItem(taskItem: test)
}
