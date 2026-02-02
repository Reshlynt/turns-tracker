//
//  Task.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//
//  This is a task assignment that would appear on a person's task row.
//  Each is unique to a person, though the assignments need only persist until the day is done.

// TODO: A TaskAssignment is a task is assigned to a Person. All Persons objects contain an array of TaskAssignments that denote what task they are supposed to do. This array would be the Taskrow

import Foundation
import SwiftData

class Task: Identifiable, ObservableObject {
    var id: UUID = UUID()
    var title: String
    var order: Int
    var imageName: String
    
    init(title: String, order: Int = 0, imageName: String = "cat-meme") {
        self.title = title
        self.order = order
        self.imageName = imageName
    }
    
}
