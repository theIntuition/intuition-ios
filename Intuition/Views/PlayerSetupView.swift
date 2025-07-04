//
//  PlayerSetupView.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import SwiftUI

struct PlayerSetupView: View {
    @State private var isCreatingMatch = true

    var body: some View {
        VStack(spacing: 20) {
            Picker("Choose", selection: $isCreatingMatch) {
                Text("Create Match").tag(true)
                Text("Join Match").tag(false)
            }
            .pickerStyle(.segmented)

            Text(isCreatingMatch ? "Create a new multiplayer match." : "Join an existing match.")
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Player Setup")
    }
}
