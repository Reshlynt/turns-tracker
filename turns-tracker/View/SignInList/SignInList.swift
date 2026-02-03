//
//  SwiftUIView.swift
//  turns-tracker
//
//  Created by Scott Do on 1/5/26.
//

import SwiftUI
import SwiftData
struct SignInList: View {
    
    // Environment variables
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss

    // State variables
    @State private var showSignInForm = false
    @State private var signedInPeople: [Person] = []
    
    var body: some View {
        List {
            ForEach(signedInPeople) { person in
                HStack {
                    PersonQuickInfo(person: person)
                    PersonTaskRow(taskRow: Taskrow())
                    
                }
            }
        }
        
    }
    
}

#Preview {
    SignInList()
}

//class UserProgress: ObservableObject {
//    @Published var score = 0
//}




//@ObservedObject var progress: UserProgress
//var body: some View {
//    Button("Increase Score") {
//        progress.score += 1
//    }
//}
//}
//
//struct ContentPiew: View {
//@StateObject var progress = UserProgress()
//var body: some View {
//    VStack {
//        Text("Your scoer is \(progress.score)")
//        SignInList(progress: progress)
//    }
//}
