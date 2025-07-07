//
//  IntuitionApp.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//

import SwiftUI

@main
struct IntuitionApp: App {
    init() {
        GameKitManager.shared.authenticate()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainMenuView()
            }
        }
    }
}
