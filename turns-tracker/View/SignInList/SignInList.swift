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
    @ObservedObject var vm: SignInViewModel  // receives the instance
    
    // Test data
    let p = Person(name: "Jeffery")

        var body: some View {
            List {
                ForEach(vm.signedInPeople) { person in
                    HStack {
                        PersonQuickInfo(person: person)
                        PersonTaskRow(taskRow: Taskrow())
                    }
                }
            }
            .navigationTitle("Signed In")
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        // TODO: Prompt the user to add a person via the sign in form.
                        showSignInForm = true
                    } label: {
                        Label("Add", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                    }
                    
                    Button {
                        // TODO: Prompt to remove
                    } label: {
                        Label("Remove All", systemImage: "trash")
                            .labelStyle(.titleAndIcon)
                    }

                }
            }
            .sheet(isPresented: $showSignInForm) {
                SignInForm { person in
                    vm.add(person)
                } onCancel: {
                    showSignInForm = false
                }

            }
        }
    
}

#Preview {
    let vm = SignInViewModel()
    
    SignInList( vm: vm)
}
