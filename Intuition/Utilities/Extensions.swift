//
//  Extensions.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//

import SwiftUI
import GameKit

extension View {
    func roundedBorder(color: Color = .gray, width: CGFloat = 1, cornerRadius: CGFloat = 8) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: width)
            )
    }
}

extension UIView {
    func findHostingController() -> UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if let hostingController = responder as? UIHostingController<AnyView> {
                return hostingController
            }
            responder = responder?.next
        }
        return nil
    }
}

extension GameKitManager: GKMatchmakerViewControllerDelegate {
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
        print("Matchmaking cancelled by user.")
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        viewController.dismiss(animated: true)
        print("Matchmaking failed: \(error.localizedDescription)")
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true)
        self.match = match
        match.delegate = self
        print("Match found with players: \(match.players.map { $0.displayName })")
    }
}

