//
//  TurnTracker.swift
//  turns-tracker
//
//  Created by Scott Do on 10/1/25.
//
//  The primary screen to track people and their assignments.

import SwiftUI

struct TurnTracker: View {
    var body: some View {
        HStack {
//            PersonsList()
        }
    }
}

#Preview {
    let modelData = ModelData()
    TurnTracker()
        .environment(ModelData())
}
