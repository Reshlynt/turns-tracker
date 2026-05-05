//
//  PersonTaskRow.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//


// It goes something like this:
// A task is put into the taskbar. That is the DropDestination action in this code. Then an algorithm is automatically triggered to find the next available person for work. An alert of some kind is triggered for a color change to allow the user to easily identify who can work. Once another task is dragged in, the process repeats.

import SwiftUI

struct PersonTaskRow: View {

    // Bindings
    @Binding var taskList: [TaskAssignment]
    @ObservedObject var vm: SignInViewModel
    @State var colorChangeOnAvailable: Bool
    
    // Task capsule information
    let capsuleWidth: CGFloat = 55
    let capsuleHeight: CGFloat = 75
    let verticalInset: CGFloat = 10
    let horizontalInset: CGFloat = 16
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(colorChangeOnAvailable ? Color.blue : Color.gray)
                .frame(height: 90)
                .opacity(0.5)
                

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(taskList) { task in
                        TaskItem(taskItem: task) {
                            deleteTask(task)
                        }
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
        .dropDestination(for: TaskAssignment.self) { droppedTasks, location in
            taskList.append(contentsOf: droppedTasks)
            vm.updateWage(money: droppedTasks.first?.pricing)
            vm.updateNextAvailable()
            return true
        }
    }
    
    // MARK: - Helper Functions
    private func deleteTask(_ task: TaskAssignment) {
        taskList.removeAll { $0.id == task.id }
    }
}

#Preview {
    @Previewable @State var taskRowTest: [TaskAssignment] = [
        TaskAssignment(title: "task 1"),
        TaskAssignment(title: "task 2"),
        TaskAssignment(title: "task 3")
//        TaskAssignment(title: "task 4", order: 3),
//        TaskAssignment(title: "task 5", order: 4),
//        TaskAssignment(title: "task 6", order: 5),
//        TaskAssignment(title: "task 7", order: 6),
//        TaskAssignment(title: "task 8", order: 7)
    ]
    
    let vm = SignInViewModel()

    PersonTaskRow(taskList: $taskRowTest, vm: vm, colorChangeOnAvailable: false)
}
