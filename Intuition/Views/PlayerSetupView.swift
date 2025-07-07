//
//  PlayerSetupView.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//

import GameKit
import SwiftUI

struct PlayerSetupView: View {
    @State private var isCreatingMatch = true

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                NavigationLink("Create Game") {
                    CreateGameView()
                }
                NavigationLink("Join Game") {
                    JoinGameView()
                }
            }
        }
        .padding()
        .navigationTitle("Player Setup")
    }
}
