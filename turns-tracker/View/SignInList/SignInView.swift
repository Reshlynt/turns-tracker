//
//  SignInView.swift
//  turns-tracker
//
//  Created by Scott Do on 2/13/26.
//

import SwiftUI

struct SignInView: View {
    
    let vm: SignInViewModel
    
    var body: some View {
        NavigationSplitView {
            SignInList(vm: vm)
                .frame(minWidth: 220, idealWidth: 700)            // never collapse smaller than ~220
                .frame(maxWidth: .infinity)      // allow expansion if window grows
                .layoutPriority(2)
        } detail: {
            TaskListing()
                .frame(minWidth: 300) // prefer a wider task column
                .frame(maxWidth: .infinity)
        }
        .frame(minWidth: 700, minHeight: 420) // sensible minimum window size for the whole view
        
    }
}

#Preview {
    let person = Person(name: "james")
    let vm = SignInViewModel(initial: [person])
    
    SignInView(vm: vm)
}
