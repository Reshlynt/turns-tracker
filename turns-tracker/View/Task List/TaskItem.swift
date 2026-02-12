//
//  TaskItem.swift
//  turns-tracker
//
//  Created by Scott Do on 2/10/26.
//

import SwiftUI

struct TaskItem: View {
    
    let taskItem: TaskAssignment
    
    // Capsule dimensions
    let capsuleWidth: CGFloat = 55
    let capsuleHeight: CGFloat = 75
    let verticalInset: CGFloat = 10
    let horizontalInset: CGFloat = 16
    
    var body: some View {
        VStack {
            Image(taskItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: capsuleWidth * 0.7,
                       height: capsuleHeight * 0.5,
                       alignment: .top)
                .clipped()
            Text(taskItem.title)
        }
        .background(
            Capsule()
                .fill(.blue)
                .frame(width: capsuleWidth, height: capsuleHeight)
        )
    }
}

#Preview {
    let test = TaskAssignment(title: "task", imageName: "cat-meme")
    TaskItem(taskItem: test)
}
