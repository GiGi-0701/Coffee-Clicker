//
//  BrewingAttributes.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 17.10.25.
//

import ActivityKit
import SwiftUI

struct BrewingAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var elapsedTime: Int
        var totalTime: Int
        var isBrewing: Bool
        var name: String
    }
    
    var id: UUID
}
