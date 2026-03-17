//
//  NextAvailableTestView.swift
//  turns-tracker
//
//  Created by Scott Do on 3/10/26.
//

import SwiftUI

struct NextAvailableTestView: View {
    @ObservedObject var vm = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Next Available Person Test")
                .font(.headline)
            
            // Display all signed-in people and their task counts
            List {
                ForEach(vm.signedInPeople) { person in
                    HStack {
                        Text(person.name)
                        Spacer()
                        Text("Tasks: \(person.taskList.count)")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Divider()
            
            // Display the result
            if let nextPerson = vm.nextAvailablePerson() {
                VStack {
                    Text("Next Available:")
                        .font(.headline)
                    Text(nextPerson.name)
                        .font(.title)
                        .foregroundColor(.green)
                    Text("Tasks: \(nextPerson.taskList.count)")
                        .foregroundColor(.gray)
                }
            }
            
            
            // Test buttons to manipulate data
            VStack(spacing: 10) {
                Button("Add Test Data") {
                    setupTestData()
                }
                
                Button("Add Task to Alice") {
                    if vm.signedInPeople.count > 0 {
                        vm.signedInPeople[0].taskList.append(TaskAssignment(title: "new task"))
                    }
                }
                
                Button("Add Task to Charlie") {
                    if vm.signedInPeople.count > 0 {
                        vm.signedInPeople[2].taskList.append(TaskAssignment(title: "new task"))
                    }
                }
                
                Button("Clear All") {
                    vm.signedInPeople.removeAll()
                }
            }
            .padding()
        }
    }
    
    private func setupTestData() {
        vm.signedInPeople.removeAll()
        
        let alice = Person(name: "Alice")
        let bob = Person(name: "Bob")
        let charlie = Person(name: "Charlie")
        
        vm.add(alice)
        vm.add(bob)
        vm.add(charlie)
        
        vm.signedInPeople[0].taskList = [TaskAssignment(title: "task1")]
        vm.signedInPeople[1].taskList = [
            TaskAssignment(title: "task1"),
            TaskAssignment(title: "task2"),
            TaskAssignment(title: "task3")
        ]
    }
}

#Preview {
    NextAvailableTestView()
}
