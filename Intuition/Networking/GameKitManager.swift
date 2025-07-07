//
//  GameKitManager.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import Foundation
import GameKit
import SwiftUI

final class GameKitManager: NSObject, ObservableObject, GKMatchDelegate {
    static let shared = GameKitManager()
    
    @Published var localPlayerID: String?
    var match: GKMatch?
    
    func authenticate() {
        GKLocalPlayer.local.authenticateHandler = { gcAuthVC, error in
            if let vc = gcAuthVC {
                if let rootVC = UIApplication.shared.connectedScenes
                    .compactMap({ ($0 as? UIWindowScene)?.keyWindow })
                    .first?.rootViewController {
                    rootVC.present(vc, animated: true)
                }
            } else if GKLocalPlayer.local.isAuthenticated {
                self.localPlayerID = GKLocalPlayer.local.gamePlayerID
                print("Game Center authenticated as: \(GKLocalPlayer.local.displayName)")
            } else if let error = error {
                print("Game Center authentication error: \(error.localizedDescription)")
            }
        }
    }
    
    func createMatch() {
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 4
        
        let mmvc = GKMatchmakerViewController(matchRequest: request)
        mmvc?.matchmakerDelegate = self
        
        if let mmvc = mmvc,
           let rootVC = UIApplication.shared.connectedScenes
                .compactMap({ ($0 as? UIWindowScene)?.keyWindow })
                .first?.rootViewController {
            rootVC.present(mmvc, animated: true)
        } else {
            print("Failed to create or present GKMatchmakerViewController")
        }
    }
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        print("Received data from player \(player.displayName)")

        do {
            let receivedCard = try JSONDecoder().decode(Int.self, from: data)
            DispatchQueue.main.async {
                // Play the received card in the shared game state
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let rootView = windowScene.windows.first?.rootViewController?.view,
                   let hostingController = rootView.findHostingController() as? UIHostingController<GameView> {
                    hostingController.rootView.gameState.playCard(receivedCard)
                }
            }
        } catch {
            print("Failed to decode received data: \(error.localizedDescription)")
        }
    }
}
