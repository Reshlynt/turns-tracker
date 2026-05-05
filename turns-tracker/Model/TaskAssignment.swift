//
//  Task.swift
//  turns-tracker
//
//  Created by Scott Do on 10/9/25.
//
//  This is a task assignment that would appear on a person's task row.
//  Each is unique to a person, though the assignments need only persist until the day is done.

import Foundation
import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@Model
final class TaskAssignment: Identifiable, Transferable, Hashable, Sendable, Codable {
    
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var imageName: String
    var pricing: Decimal
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .json)
    }
    
    init(title: String = "", imageName: String = "cat-meme", pricing: Decimal = 0.0) {
        self.title = title
        self.imageName = imageName
        self.pricing = 0.0
    }
    
    // MARK: - Codable Conformance
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName
        case pricing
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.imageName = try container.decode(String.self, forKey: .imageName)
        self.pricing = try container.decode(Decimal.self, forKey: .pricing)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(imageName, forKey: .imageName)
        try container.encode(pricing, forKey: .pricing)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TaskAssignment, rhs: TaskAssignment) -> Bool {
        lhs.id == rhs.id
    }
}
