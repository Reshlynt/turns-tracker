//
//  SIgnInViewModel.swift
//  turns-tracker
//
//  Created by Scott Do on 2/4/26.
//

import Foundation
import Combine

final class SignInViewModel: ObservableObject {
    
    @Published var signedInPeople: [Person] = []

    init(initial: [Person] = []) {
        self.signedInPeople = initial
    }

    // Add a person to the list
    func add(_ person: Person) {
        signedInPeople.append(person)
    }

    // Remove a person by id
    func remove(_ person: Person) {
        signedInPeople.removeAll { $0.id == person.id }
    }

    // Replace full contents
    func setAll(_ people: [Person]) {
        signedInPeople = people
    }
}
