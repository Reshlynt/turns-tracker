//
//  DataToImageConverter.swift
//  turns-tracker
//
//  Created by Scott Do on 4/21/26.
//
// This file holds a function to convert Data into Image, if valid, and nothing else.

import Foundation
import SwiftUI


final class DataToImageConverter {
    static func convertDataToImage(photoData: Data?) -> Image? {
        guard
            let photoData,
            let nsImage = NSImage(data: photoData)
        else {
            return nil
        }

        return Image(nsImage: nsImage)
    }
}
