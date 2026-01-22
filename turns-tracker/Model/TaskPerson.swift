//
//  TaskPerson.swift
//  turns-tracker
//
//  Created by Scott Do on 1/19/26.
//

import Foundation
import SwiftData
@Model
class TaskPerson: Identifiable {
    
    private(set) var id: UUID
    private var associatedPerson: Person
    var taskAssignmentList: [TaskAssignment] = []
    
    init(id: UUID, associatedPerson: Person, taskAssignmentList: TaskAssignment) {
        self.id = id
        self.associatedPerson = associatedPerson
    }
    
    // Getters
    func getAssociatedPerson() -> Person {
        return associatedPerson
    }
}
