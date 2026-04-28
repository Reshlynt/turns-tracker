//
//  PicPresentTest.swift
//  turns-tracker
//
//  Created by Scott Do on 4/25/26.
//

import SwiftUI
import SwiftData

struct PicPresentTest: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var settingsArray: [AppSettings]
    
    var settings: AppSettings {
        if let existing = settingsArray.first {
            return existing
        } else {
            let newSettings = AppSettings()
            modelContext.insert(newSettings)
            return newSettings
        }
    }
    
    
    var body: some View {
        VStack {
            Text("hello world")
            if let testPic = DataToImageConverter.convertDataToImage(photoData: settings.image) {
                testPic
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 200)
            }
        }
    }
}

#Preview {
    PicPresentTest()
}
