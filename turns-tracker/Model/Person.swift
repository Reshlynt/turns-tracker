//
//  Person.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//  A Person is a struct that holds important information about an individual doing a task.
//  Each should contain an id to identify each unique individual, a name, a PIN, and a picture to identify themselves.

import Foundation
import SwiftData
import SwiftUI

@Model
class Person {
    // Identifiers of a person
    var id: UUID
    var name: String
    var pin: Int
    var imageIconName: String
    
    init(id: UUID, name: String, pin: Int, imageIconName: String) {
        self.id = id
        self.name = name
        self.pin = pin
        self.imageIconName = imageIconName
    }
}
