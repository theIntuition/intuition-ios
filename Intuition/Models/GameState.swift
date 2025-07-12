//
//  GameState.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import Foundation
import Combine

class GameState: ObservableObject {
    @Published var level: Int = 1
    @Published var lives: Int = 3
    @Published var shurikens: Int = 1
    @Published var ownCards: [Int] = []
    @Published var playedCards: [Int] = []
    
    func startLevel() {
        ownCards = (1...100).shuffled().prefix(level).sorted()
        playedCards = []
    }
    
    func playCard(_ card: Int) {
        if let lowestCard = (ownCards + playedCards).min(), card == lowestCard {
            playedCards.append(card)
            ownCards.removeAll { $0 == card }
            
            // Send the played card to other players
            if let match = GameKitManager.shared.match {
                do {
                    let dataToSend = try JSONEncoder().encode(card)
                    try match.sendData(toAllPlayers: dataToSend, with: .reliable)
                } catch {
                    print("Failed to send card: \(error.localizedDescription)")
                }
            }
            
            checkLevelCompletion()
        } else {
            loseLife()
        }
    }
    
    private func checkLevelCompletion() {
        if ownCards.isEmpty {
            level += 1
            startLevel()
        }
    }
    
    private func loseLife() {
        lives -= 1
        if lives <= 0 {
            // Handle game over logic, e.g. navigate to EndGameView
        } else {
            startLevel()
        }
    }
}
