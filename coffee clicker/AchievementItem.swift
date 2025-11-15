//
//  AchievementItem.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 07.10.25.
//

import Foundation

struct AchievementItem: Identifiable {
    let id = UUID ()
    let title: String
    let reward: Int
    let description: String
}

struct SpecialAchievementItem: Identifiable {
    let id = UUID ()
    let reward: Int
    let title: String
    let requirement: String
    let description: String
}
