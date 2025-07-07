//
//  CreateGameView.swift
//  Intuition
//
//  Created by Tyler Diep on 2025-07-06.
//

import GameKit
import SwiftUI

struct CreateGameView: View {
    @State private var showGameCenterLoginAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Create a new multiplayer match." )
            
            Button("Start a new match") {
                if GKLocalPlayer.local.isAuthenticated {
                    GameKitManager.shared.createMatch()
                } else {
                    showGameCenterLoginAlert = true
                }
            }
        }
        .alert("Game Center Not Signed In", isPresented: $showGameCenterLoginAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("You must be signed into Game Center to start a match. Please sign in from the Settings app.")
        }
    }
}
