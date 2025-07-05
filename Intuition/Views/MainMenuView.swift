//
//  MainMenuView.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Intuition")
                .font(.largeTitle)
                .bold()

            NavigationLink("Start Game") {
                PlayerSetupView()
            }

            NavigationLink("How to Play") {
                HowToPlayView()
            }

            NavigationLink("Settings") {
                SettingsView()
            }
        }
        .padding()
    }
}
