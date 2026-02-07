//
//  Person.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//  A Person is a model that holds important information about an individual doing a task.

// TODO: A Person should be stored on a database that this app retains to keep a record of all technicians that are recorded. They are organized by which is entered first. I would need a PIN to make this Idenfiable for loop navigation, a Person's name to asertain who they are to the user, their PIN to sign into a sign in list as that Person, whether they are checked in or not, what pay rate for the record keeping in the background, and a task list to see what tasks they are doing at a day.

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
    var taskList: Taskrow = Taskrow(taskList: [])
    
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
        self.taskList = taskList ?? self.taskList
    }
    
    // MARK: - Helpers
    /// Generates a 6 digin PIN
    static func generatePinString() -> String {
        let n = Int.random(in: 0...999_999)
        return String(format: "%06d", n)
    }
}
