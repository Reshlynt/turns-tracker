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
                ForEach(vm.signedInPeople.reversed().indices, id: \.self) { index in
                    let reversedIndex = vm.signedInPeople.count - 1 - index
                    HStack {
                        PersonQuickInfo(person: vm.signedInPeople[reversedIndex])
                        
                        // What about if this finds the person?
                        
                        if vm.signedInPeople[reversedIndex] == vm.nextAvailable {
                            PersonTaskRow(taskList: $vm.signedInPeople[reversedIndex].taskList, vm: vm, colorChangeOnAvailable: true)
                        } else {
                            PersonTaskRow(taskList: $vm.signedInPeople[reversedIndex].taskList, vm: vm, colorChangeOnAvailable: false)
                        }
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Signed In")
            .toolbar {
                ToolbarItemGroup {
                    Button {
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
                    // If there is exactly one person, this implies that this is the first person to sign in, and thus they already have priority.
                    if vm.signedInPeople.count == 1 {
                        vm.updateNextAvailable()
                    }
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
