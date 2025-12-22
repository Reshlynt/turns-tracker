//
//  SignInPrompt.swift
//  turns-tracker
//
//  Created by Scott Do on 10/28/25.
//

// TODO: This view is the sign in prompt where the user signs in someone with the matching PIN. It should look ideally like a typical iOS dialpad. There should be a way to exit out of the window, and signing in with the correct PIN and PINs with not user assigned cases.

import SwiftUI
import SwiftData

struct SignInPrompt: View {
    
    @State private var PIN: String = ""
    @State private var placeholder: String = "PIN"
    
    var body: some View {
        VStack {
            Text("Type in your PIN:")
            TextField(placeholder, text: $PIN)
            Button(action: {
                if verifyPin(pin: PIN) {
                    placeholder = "Signed in person."
                } else {
                    placeholder = "Invalid PIN."
                }
                PIN = ""
            }, label: {
                Text("Confirm")
                    .font(.callout)
            })
        }
    }
    
    private func verifyPin(pin: String) -> Bool {
        if(pin.count != 6) {
            return false
        }
        return true
    }
}



#Preview {
    SignInPrompt()
}
