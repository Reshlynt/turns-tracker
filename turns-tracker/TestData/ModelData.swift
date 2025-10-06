//
//  ModelData.swift
//  turns-tracker
//
//  Created by Scott Do on 9/25/25.
//
//  This is dummy data served to observe how the program operates with ideal data.

import Foundation

@Observable
class ModelData {
    
    let personList = [
        Person(name: "jimbo", pin: 12345, photoName: "cat-stare"),
        Person(name: "davey", pin: 34567, photoName: "cat-meme")
    ]
    
    let taskAssignmentList = [
        TaskAssignment(assignmentTitle: "task", iconName: "cat-meme"),
        TaskAssignment(assignmentTitle: "name", iconName: "cat-meme"),
        TaskAssignment(assignmentTitle: "boys", iconName: "cat-meme")
    ]
}

// example
