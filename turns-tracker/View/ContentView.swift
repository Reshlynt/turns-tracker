//
//  ContentView.swift
//  turns-tracker
//
//  Created by Scott Do on 8/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    // Loads persistent data storage space
    @Environment(\.modelContext) var modelContext
    
    // Bindings
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $visibility) {
            List {
                ForEach(NavigationCategory.allCases, id: \.self) { category in
                    
                    NavigationLink(destination: destinationView(for: category)) {
                        Text(category.title)
                    }
                }
            }
        } detail: {
            Color.blue
        }
        .navigationSplitViewStyle(.balanced)
    }
    
    @ViewBuilder
    private func destinationView(for category: NavigationCategory) -> some View {
            switch category {
            case .peopleDatabase:
                PeopleDatabase()
            case .signInList:
                SignInList()
            }
        }
}

// Enumerables for category names
// All names are under camel case syntax
enum NavigationCategory: String, CaseIterable {
    case peopleDatabase
    case signInList
    
    var title: String {
        rawValue.camelCaseToTitle
    }
}

// String function extension to allocate for the category naming
extension String {
    /// Inserts spaces before uppercase letters and capitalizes each word.
    /// Examples: "peopleDatabase" -> "People Database", "signInList" -> "Sign In List"
    var camelCaseToTitle: String {
        guard !isEmpty else { return self }
        var result = ""
        for char in self {
            if char.isUppercase && !result.isEmpty {
                result.append(" ")
            }
            result.append(char)
        }
        return result
            .split(separator: " ")
            .map { $0.capitalized }   // Capitalize each word (locale-aware enough for UI)
            .joined(separator: " ")
    }
}



#Preview {
    ContentView()
        .modelContainer(for: [Person.self, TaskPerson.self])
}

