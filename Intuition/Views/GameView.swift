//
//  GameView.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import SwiftUI

struct GameView: View {
    @ObservedObject var gameState: GameState
    
    var body: some View {
        VStack {
            HStack {
                Text("Lives: \(gameState.lives)")
                Spacer()
                Text("Level: \(gameState.level)")
                Spacer()
                Text("Shurikens: \(gameState.shurikens)")
            }
            .padding()

            Spacer()
            
            Text("Played Cards")
                .font(.headline)
            
            VStack {
                ForEach(gameState.playedCards, id: \.self) { card in
                    Text("\(card)")
                        .font(.title)
                }
            }
            .padding()

            Spacer()
            
            HStack {
                ForEach(gameState.ownCards.sorted(), id: \.self) { card in
                    Button(action: {
                        gameState.playCard(card)
                    }) {
                        Text("\(card)")
                            .font(.title2)
                            .frame(width: 50, height: 70)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Game")
    }
}
