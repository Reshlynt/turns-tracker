//
//  ContentView.swift
//  turns-tracker
//
//  Created by Scott Do on 8/23/25.
//

import SwiftUI
import SwiftData
import AppKit

struct ContentView: View {
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    @ObservedObject var signInVM: SignInViewModel
    @Query private var settingsArray: [AppSettings]

    var settings: AppSettings {
        settingsArray.first ?? AppSettings()
    }

    var body: some View {
        ZStack {
            NavigationSplitView(columnVisibility: $visibility) {
                List {
                    ForEach(NavigationCategory.allCases, id: \.self) { category in
                        NavigationLink(destination: destinationView(for: category)) {
                            Text(category.title)
                        }
                    }

                    Divider()
                }
            } detail: {
            }
            .navigationSplitViewStyle(.balanced)
            .background {
                Image("cat-meme")
            }
        }
    }

    @ViewBuilder
    private func destinationView(for category: NavigationCategory) -> some View {
        switch category {
        case .peopleDatabase:
            PeopleDatabase()
        case .signInList:
            SignInView(vm: signInVM)
        }
    }
}

enum NavigationCategory: String, CaseIterable {
    case peopleDatabase
    case signInList

    var title: String {
        rawValue.camelCaseToTitle
    }
}

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
            .map { $0.capitalized }
            .joined(separator: " ")
    }
}

#Preview {
    let vm = SignInViewModel()
    ContentView(signInVM: vm)
        .modelContainer(for: [Person.self, TaskAssignment.self, AppSettings.self], inMemory: true)
}
