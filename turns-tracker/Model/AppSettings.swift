//
//  AppSettings.swift
//  turns-tracker
//
//  Created by Scott Do on 3/4/26.
//

import Foundation
import SwiftData

@Model
final class AppSettings: Identifiable {
    @Attribute(.unique) var id: String = "app-settings"
    var backgroundImagePath: String = ""
    
    init(backgroundImagePath: String = "") {
        self.backgroundImagePath = backgroundImagePath
    }
}
