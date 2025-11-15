//
//  coffee_clickerApp.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 04.09.25.
//

import SwiftUI
import UserNotifications

@main
struct coffee_clickerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appData = AppData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            switch newPhase {
            case .active:
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                UserDefaults.standard.register(defaults: AppData.registeredDefaults)
                appData.loadData()
                print("App became active.")
            case .background:
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                for i in 0..<appData.coffeeAchievements.count {
                    if !appData.completedCoffeeAchievements[i] {
                        appData.offlineNotification(
                            body: appData.coffeeItems[i].title,
                            currentScore: appData.score,
                            currentCPS: appData.cps,
                            target: appData.coffeeAchievements[i]
                        )
                    }
                }
                appData.saveData()
                print("App moved to background.")
            default:
                break
            }
        }
    }
}
