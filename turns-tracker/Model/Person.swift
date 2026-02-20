//
//  Person.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//  A Person is a model that holds important information about an individual doing a task.

import Foundation
import SwiftData

@Model
final class Person: Identifiable, ObservableObject {
    @Attribute(.unique) var id = UUID()
    var name: String
    var pin: String
    var checkedIn: Bool
    var payRate: Decimal
    @Transient
    @Published
    var taskList: [TaskAssignment] = []
    
    init (
        name: String = "John",
        pin: String? = nil,
        checkedIn: Bool = false,
        payRate: Decimal = 0.0,
        taskList: [TaskAssignment] = []
    ) {
        self.name = name
        self.pin = pin ?? Self.generatePinString()
        self.checkedIn = checkedIn
        self.payRate = payRate
        self.taskList = taskList
    }

    
    // MARK: - Helpers
    /// Generates a 6 digin PIN
    static func generatePinString() -> String {
        let n = Int.random(in: 0...999_999)
        return String(format: "%06d", n)
    }
    
}
