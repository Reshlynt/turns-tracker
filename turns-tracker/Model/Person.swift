//
//  Person.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//  A Person is a model that holds important information about an individual doing a task.

import Foundation
import SwiftData

@Model
class Person {
    @Attribute(.unique) var id = UUID()
    var name: String
    var pin: String
    var checkedIn: Bool
    var payRate: Decimal
    @Transient
    let taskList: Taskrow = Taskrow(taskList: [])
    
    init (
        name: String = "John",
        pin: String? = nil,
        checkedIn: Bool = false,
        payRate: Decimal = 0.0,
        taskList: Taskrow? = nil
    ) {
        self.name = name
        self.pin = pin ?? Self.generatePinString()
        self.checkedIn = checkedIn
        self.payRate = 0.0
    }
    
    // MARK: - Helpers
    /// Generates a 6 digin PIN
    static func generatePinString() -> String {
        let n = Int.random(in: 0...999_999)
        return String(format: "%06d", n)
    }
    
}
