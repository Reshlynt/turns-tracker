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
class Person: Identifiable {
    
    private(set) var id: UUID
    private var name: String
    var pin: String
    var checkedIn: Bool
    var payRate: Double
    
    // TODO: Figure out how to get a picture of a person onto this without putting the image into SwiftData
    
    init(name: String) {
        self.id = UUID()
        self.name = name
        self.pin = Self.generatePinString()
        self.checkedIn = false
        self.payRate = 0.0
    }
    
    
    // Getters
    func getName() -> String {
        return self.name
    }
    
    // Setters
    func SetName(name: String) -> Void {
        self.name = name
    }
    
    static func generatePinString() -> String {
        // Generates a random Int in 0...999_999 (one million possibilities),
        // then formats it with leading zeros to always produce 6 characters.
        let n = Int.random(in: 0...999_999)
        return String(format: "%06d", n)
    }

}
