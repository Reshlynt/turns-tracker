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
    
    @Attribute(.externalStorage)
    var image: Data?
    
    init(backgroundImageData: Data? = nil){
        self.image = backgroundImageData
    }
}
