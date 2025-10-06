//
//  UTTypeExtension.swift
//  turns-tracker
//
//  Created by Scott Do on 9/26/25.
//

import Foundation
import UniformTypeIdentifiers

let bundleID = Bundle.main.bundleIdentifier

extension UTType {
    static let taskAssignment = UTType(exportedAs: bundleID!)
}
