//
//  SwiftUIView.swift
//  turns-tracker
//
//  Created by Scott Do on 1/5/26.
//

import SwiftUI
import SwiftData

struct SignInList: View {
    @Environment(\.modelContext) var modelContext
    @Query var signedInPeople: [Person]
    
    @State private var showSignInForm = false
    
    var body: some View {
        List {
            ForEach(signedInPeople) { taskPerson in
                HStack {
                    PersonQuickInfo(person: taskPerson)
                    
                    PersonTaskRow(taskRow: taskPerson.tasks)
                }
            }
        }
        .navigationTitle("Signed In People")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showSignInForm = true }) {
                    Label("Add", systemImage: "plus")
                }
            }
            
            ToolbarItem {
                Button(action: wipeAllSignedIn) {
                    Label("Delete all", systemImage: "trash")
                }
            }
        }
        .sheet(isPresented: $showSignInForm) {
            SignInPrompt { signedPerson in
                modelContext.insert(signedPerson)
                showSignInForm = false
            } onCancel: {
                showSignInForm = false
            }
        }
        .labelStyle(TitleAndIconLabelStyle())
    }
    
    
    // Wipes all people signed into the program.
    private func wipeAllSignedIn() {
        do {
            try modelContext.delete(model: Person.self)
        } catch {
            print(error)
        }
    }
}

#Preview {
    SignInList()
}
