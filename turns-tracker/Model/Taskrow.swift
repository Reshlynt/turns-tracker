//
//  Taskrow.swift
//  turns-tracker
//
//  Created by Scott Do on 2/2/26.
//

// TODO: A Taskrow is a class that contains an array of Tasks. It will be used in the sign in list to keep track of all tasks that a person would have. By default, it would be empty. It can be populated during run time but the progress is not saved if the software closes.

import Foundation

final class Taskrow: ObservableObject {
    @Published var taskList: [TaskAssignment]
    
    init(taskList: [TaskAssignment] = []) {
        self.taskList = taskList
    }
    
    // Helpers
    func eraseTaskList() {
        taskList.removeAll()
    }
}
