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
    @Published var nextAvailable: Person? = nil

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
    
    // MARK: - Helper Functions
    func nextAvailablePerson() -> Person? {
        guard !signedInPeople.isEmpty else { return nil }
        
        return signedInPeople.min { person1, person2 in
            if person1.taskList.count == person2.taskList.count {
                return signedInPeople.firstIndex(of: person1) ?? 0 < signedInPeople.firstIndex(of: person2) ?? 0
            }
            
            return person1.taskList.count < person2.taskList.count
        }
    }
    
    // Updates the nxt available person on a person sign in list.
    func updateNextAvailable() {
        self.nextAvailable = nextAvailablePerson()
    }
    
    // Updates the pay that someone gets from task completion.
    // I could work with the logic that I can
    func updateWage(money: Decimal?){
        self.nextAvailable?.payRate += money!
    }
}
