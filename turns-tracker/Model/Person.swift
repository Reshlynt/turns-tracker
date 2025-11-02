//
//  Person.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//  A Person is a model that holds important information about an individual doing a task.
//  Each should contain an id to identify each unique individual, a name, a PIN, and a picture to identify themselves.

// TODO: A Person should be stored on a database that this app retains to keep a record of all technicians that are recorded. They are organized by which is entered first.

import Foundation
import SwiftData

@Model
class Person: Identifiable {
    
    // Identifiers of a person
    var id: UUID = UUID()
    private var name: String
    var pin: String
    var tasks: [TaskAssignment] = []
    
    // TODO: Figure out how to get a picture of a person onto this without putting the image into SwiftData
    
    init(name: String) {
        self.name = name
        self.pin = Self.generatePinString()
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
