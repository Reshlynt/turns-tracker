//
//  PersonAssignment.swift
//  turns-tracker
//
//  Created by Scott Do on 9/26/25.
//
//  PersonAssignment is an object that each contains the name and the icon to represent. This
//  allows the user to decide what a person is assigned to, customizable to their content.

import Foundation
import SwiftUI

struct TaskAssignment: Codable, Transferable, Identifiable, Hashable {
    let id: UUID
    let assignmentTitle: String
    let iconName: String
    
    private var icon: Image? {
        Image(iconName)
    }
    
    init(id: UUID = UUID(), assignmentTitle: String, iconName: String) {
        self.id = id
        self.assignmentTitle = assignmentTitle
        self.iconName = iconName
    }
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .taskAssignment)
    }
    
    func getIcon() -> Image? {
        return icon
    }
}
