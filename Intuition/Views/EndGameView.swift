//
//  EndGameView.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import SwiftUI

struct EndGameView: View {
    var levelReached: Int
    var mistakes: Int
    var timeTaken: TimeInterval
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Game Over!")
                .font(.largeTitle)
                .bold()
            
            Text("Levels completed: \(levelReached)")
            Text("Mistakes made: \(mistakes)")
            Text("Time taken: \(Int(timeTaken)) seconds")
            
            NavigationLink("Restart Game", destination: MainMenuView())
                .padding()
        }
        .padding()
        .navigationTitle("Results")
    }
}
