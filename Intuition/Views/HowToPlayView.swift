//
//  HowToPlayView.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ScrollView {
            Text("""
            Intuition is a cooperative game where players try to place their cards in ascending order without talking.

            - Each level deals more cards.
            - Players must place cards in the correct order.
            - Mistakes cost lives.
            - The team wins by clearing the final level.

            Good luck!
            """)
            .padding()
        }
        .navigationTitle("How to Play")
    }
}
