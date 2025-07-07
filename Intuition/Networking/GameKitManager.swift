//
//  GameKitManager.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import Foundation
import GameKit

final class GameKitManager: NSObject, ObservableObject, GKMatchDelegate, GKMatchmakerViewControllerDelegate {
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
        print("Matchmaker was cancelled by the user.")
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: any Error) {
        viewController.dismiss(animated: true)
        print("Matchmaker failed with error: \(error.localizedDescription)")
    }
    
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

        if let vc = GKMatchmakerViewController(matchRequest: request) {
            vc.matchmakerDelegate = self
            if let rootVC = UIApplication.shared.connectedScenes
                .compactMap({ ($0 as? UIWindowScene)?.keyWindow })
                .first?.rootViewController {
                rootVC.present(vc, animated: true)
            }
        }
    }
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        print("Received data from player \(player.displayName)")
        // Handle incoming game data here
    }
}
