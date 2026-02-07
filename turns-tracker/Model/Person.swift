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
final class Person: Identifiable {
    @Attribute(.unique) var id: UUID

    var name: String
    var pin: String
    var checkedIn: Bool
    var payRate: Decimal   // prefer Decimal for monetary values

    @Transient var taskRow: Taskrow = Taskrow(taskList: [])

    // MARK: - Init
    init(
        id: UUID = UUID(),
        name: String = "John",
        pin: String? = nil,
        checkedIn: Bool = false,
        payRate: Decimal = 0.0,
        taskRow: Taskrow = Taskrow(taskList: [])
    ) {
        self.id = id
        self.name = name
        self.pin = pin ?? Self.generatePinString()
        self.checkedIn = checkedIn
        self.payRate = payRate
        self.taskRow = taskRow
    }

    // MARK: - Getters
    func getName() -> String {
        name
    }
    func getPin() -> String {
        pin
    }
    func isCheckedIn() -> Bool {
        checkedIn
    }
    func getPayRate() -> Decimal {
        payRate
    }
    func getTaskRow() -> Taskrow {
        taskRow
    }
    // MARK: - Setters / mutating helpers
    /// Set the name (trims whitespace)
    func setName(_ newName: String) {
        name = newName.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    /// Set the PIN. Returns `true` if accepted, `false` otherwise.
    /// Accepts exactly 6 digits only.
    @discardableResult
    func setPin(_ newPin: String) -> Bool {
        let trimmed = newPin.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.count == 6 && trimmed.allSatisfy({ $0.isNumber }) else {
            return false
        }
        pin = trimmed
        return true
    }

    /// Regenerate random 6-digit PIN.
    func regeneratePin() {
        pin = Self.generatePinString()
    }

    /// Check in / out helpers
    func setCheckedIn(_ value: Bool) {
        checkedIn = value
    }

    func checkIn() {
        checkedIn = true
    }

    func checkOut() {
        checkedIn = false
    }

    /// Set pay rate. Returns `true` if valid (non-negative), `false` otherwise.
    @discardableResult
    func setPayRate(_ newRate: Decimal) -> Bool {
        guard newRate >= 0 else { return false }
        payRate = newRate
        return true
    }

    /// Replace the transient taskRow (UI-only)
    func setTaskRow(_ newRow: Taskrow) {
        taskRow = newRow
    }

    // MARK: - Helpers
    /// Generates a 6 digin PIN
    static func generatePinString() -> String {
        let n = Int.random(in: 0...999_999)
        return String(format: "%06d", n)
    }
}
