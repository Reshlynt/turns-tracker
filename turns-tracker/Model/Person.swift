//
//  Person.swift
//  turns-tracker
//
//  Created by Scott Do on 9/12/25.
//  A Person is a struct that holds important information about an individual doing a task.
//  Each should contain an id to identify each unique individual, a name, a PIN, and a picture to identify themselves.

import Foundation
import SwiftUI

struct Person: Identifiable, Decodable {
    let id: String
    var name: String
    var pin: Int
    var photoName: String
    
    // A list of a person's tasks
    var taskList: [TaskAssignment] = []

    init(name: String, pin: Int, photoName: String, id: String = UUID().uuidString) {
        self.id = id
        self.name = name
        self.pin = pin
        self.photoName = photoName
    }

    private var photo: Image? {
        Image(photoName)
    }
    
    func getPhoto() -> Image? {
        return photo
    }
}
