//
//  GameKitManager.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import Foundation
import GameKit

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
                self.localPlayerID = GKLocalPlayer.local.playerID
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
        
        GKMatchmaker.shared().findMatch(for: request) { match, error in
            if let error = error {
                print("Failed to create match: \(error.localizedDescription)")
            } else if let match = match {
                self.match = match
                match.delegate = self
                print("Match created with players: \(match.players.count)")
            }
        }
    }
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        print("Received data from player \(player.displayName)")
        // Handle incoming game data here
    }
}
