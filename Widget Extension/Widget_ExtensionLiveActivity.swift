//
//  Widget_ExtensionLiveActivity.swift
//  Widget Extension
//
//  Created by Giuseppe Mancuso on 17.10.25.
//

import ActivityKit
import WidgetKit
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

struct BrewingActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: BrewingAttributes.self) { context in
            VStack(alignment: .leading) {
                HStack {
                    Text(formatTime(context.state.elapsedTime))
                    Spacer()
                    ProgressView(value: Double(context.state.elapsedTime), total: Double(context.state.totalTime))
                    Spacer()
                    Text(formatTime(context.state.totalTime))
                }
                .font(.headline)
                
                Text(context.state.name)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text(formatTime(context.state.elapsedTime))
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(formatTime(context.state.totalTime))
                }
                DynamicIslandExpandedRegion(.center) {
                    ProgressView(value: Double(context.state.elapsedTime), total: Double(context.state.totalTime))
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.state.name)
                        .font(.caption)
                }
            } compactLeading: {
                Text(formatTime(context.state.elapsedTime))
                    .font(.caption2)
            } compactTrailing: {
                Text(formatTime(context.state.totalTime))
                    .font(.caption2)
            } minimal: {
                Image(systemName: "cup.and.saucer.fill")
            }
        }
    }
}

private func formatTime(_ seconds: Int) -> String {
    let minutes = seconds / 60
    let remainingSeconds = seconds % 60
    if minutes > 0 {
        return String(format: "%d:%02d", minutes, remainingSeconds)
    } else {
        return String(format: "0:%02d", remainingSeconds)
    }
}
