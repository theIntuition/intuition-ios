//
//  Player.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//


import Foundation

struct Player: Identifiable, Equatable {
    let id: UUID
    var displayName: String
    var cards: [Int] = []
}
