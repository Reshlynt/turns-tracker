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
    @Environment(\.dismiss) private var dismiss
    
    
    @State private var showSignInForm = false
    
    var body: some View {
        List {
//            ForEach(signedInPeople) { taskPerson in
//                
//            }
        }
        //.navigationTitle("Signed In People")
        //TODO: The left chevron for the navigation stack seems to have a problem where it is hidden by the navigation title. Come back to it later.
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showSignInForm = true }) {
                    Label("Add", systemImage: "plus")
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
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
//            try modelContext.delete(model: TaskPerson.self)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

#Preview {
    SignInList()
        .modelContainer(for: [Person.self])
}
