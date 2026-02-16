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

        var body: some View {
            List {
                ForEach(vm.signedInPeople) { person in
                    HStack {
                        PersonQuickInfo(person: person)
                        PersonTaskRow(taskRow: person.taskList)
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
                        vm.signedInPeople.removeAll()
                    } label: {
                        Label("Remove All", systemImage: "trash")
                            .labelStyle(.titleAndIcon)
                    }

                }
            }
            .sheet(isPresented: $showSignInForm) {
                SignInForm { person in
                    vm.add(person)
                    showSignInForm = false
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
