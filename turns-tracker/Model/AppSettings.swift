//
//  AppSettings.swift
//  turns-tracker
//
//  Created by Scott Do on 3/4/26.
//
// Contains the persistent elements of the user's preferences for an application.
// There should only ever be ONE AppSettings.

import Foundation
import SwiftData

@Model
final class AppSettings: Identifiable {
    @Attribute(.unique) var id: String = "app-settings"
    
    @Attribute(.externalStorage)
    var image: Data?
    
    init(backgroundImageData: Data? = nil){
        self.image = backgroundImageData
    }
}
