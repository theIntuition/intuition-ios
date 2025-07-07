//
//  JoinGameView.swift
//  Intuition
//
//  Created by Tyler Diep on 2025-07-06.
//

import GameKit
import SwiftUI

struct JoinGameView: View {
    @State private var showGameCenterLoginAlert = false
    
    var body: some View {
        VStack {
            Text("Join an existing match.")
                .padding()
            
            Button("Start a new match") {
                if GKLocalPlayer.local.isAuthenticated {
                    print("Player Display name: ", GKLocalPlayer.local.displayName)
                } else {
                    showGameCenterLoginAlert = true
                }
            }
        }
        .alert("Game Center Not Signed In", isPresented: $showGameCenterLoginAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("You must be signed into Game Center to join a match. Please sign in from the Settings app.")
        }
    }
}
