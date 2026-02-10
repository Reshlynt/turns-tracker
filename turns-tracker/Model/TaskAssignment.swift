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
import SwiftUI
import UniformTypeIdentifiers

struct TaskAssignment: Codable, Identifiable, Transferable, Hashable {
    
    var id: UUID = UUID()
    var title: String
    var order: Int
    var imageName: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .developerTask)
    }
    
    init(title: String = "", order: Int = 0, imageName: String = "cat-meme") {
        self.title = title
        self.order = order
        self.imageName = imageName
    }
}

extension UTType {
    static let developerTask = UTType(exportedAs: "com.scottdo.turns-tracker")
}
