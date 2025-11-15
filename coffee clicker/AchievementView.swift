//
//  AchievementView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 07.10.25.
//

import SwiftUI

struct AchievementCoffeeView: View {
    let item: AchievementItem
    let cookies: Int
    let requirement: Double
    let completed: Bool
    let formatNumber: (Double) -> String
    let type: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(item.title)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Reach \(formatNumber(requirement)) \(type)")
                        .font(.subheadline)
                }
                Spacer()
                Text("\(item.reward) 🍪")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Divider()
            Text("'\(item.description)'")
                .font(.caption)
                .fontWeight(.light)
                .padding(.top, 10.0)
        }
        .padding()
        .background(Rectangle()
            .foregroundColor(.box)
            .cornerRadius(15)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        )
        .padding()
        .overlay(
            Group {
                if completed {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.box.opacity(0.5))
                        .padding()
                }
            }
        )
        .compositingGroup()
    }
}

struct ItemRow: View {
    let index: Int
    @EnvironmentObject var appData: AppData
    let item: AchievementItem
    let type: String
    
    var body: some View {
        let cookies = appData.cookies
        let requirement = appData.itemAchievements[index]
        let completed = appData.completedItemAchievements[index]
        let formatNumber = appData.formatNumber
        
        AchievementCoffeeView(
            item: item,
            cookies: cookies,
            requirement: Double(requirement),
            completed: completed,
            formatNumber: formatNumber,
            type: type
        )
    }
}

struct SpecialAchievementView: View {
    let item: SpecialAchievementItem
    let currency: String
    let completed: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(item.requirement)
                        .font(.subheadline)
                }
                Spacer()
                Text("\(item.reward) \(currency)")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Divider()
            Text("'\(item.description)'")
                .font(.caption)
                .fontWeight(.light)
                .padding(.top, 10.0)
        }
        .padding()
        .background(Rectangle()
            .foregroundColor(.box)
            .cornerRadius(15)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        )
        .padding()
        .overlay(
            Group {
                if completed {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.box.opacity(0.5))
                        .padding()
                }
            }
        )
        .compositingGroup()
    }
}

struct CoffeeRow: View {
    let index: Int
    @EnvironmentObject var appData: AppData
    let item: AchievementItem
    let type: String
    
    var body: some View {
        let cookies = appData.cookies
        let requirement = appData.coffeeAchievements[index]
        let completed = appData.completedCoffeeAchievements[index]
        let formatNumber = appData.formatNumber
        
        AchievementCoffeeView(
            item: item,
            cookies: cookies,
            requirement: requirement,
            completed: completed,
            formatNumber: formatNumber,
            type: type
        )
    }
}

struct AchievementView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            HStack {
                Text("Achievements")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.vertical)
                Spacer()
                Text("🍪 \(appData.formatNumber(Double(appData.cookies)))")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    )
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            Picker("", selection: $appData.achievementPage) {
                Text("Achievements").tag(0)
                if appData.halloweenUnlocked || appData.christmasUnlocked {
                    Text("Specials").tag(1)
                } else {
                    Text("???").tag(1)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            if appData.achievementPage == 0 {
                ScrollView {
                    HStack {
                        Text("Coffee")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading)
                            .padding(.top)
                        Spacer()
                    }
                    ForEach(Array(appData.coffeeItems.enumerated()), id: \.element.id) { index, item in
                        CoffeeRow(index: index, item: item, type: "☕️")
                    }
                    HStack {
                        Text("Items")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.top)
                    ForEach(Array(appData.itemItems.enumerated()), id: \.element.id) { index, item in
                        ItemRow(index: index, item: item, type: appData.itemListAchievement[index])
                    }
                }
            } else if appData.achievementPage == 1 {
                if appData.halloweenUnlocked || appData.christmasUnlocked {
                    ScrollView {
                        if appData.halloweenUnlocked {
                            HStack {
                                Text("Halloween")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                    .padding(.top)
                                Spacer()
                            }
                            ForEach(Array(appData.halloweenItems.enumerated()), id: \.element.id) { index, item in
                                SpecialAchievementView(item: item, currency: "👻", completed: appData.completedHalloweenAchievements[index])
                            }
                        }
                        if appData.christmasUnlocked {
                            HStack {
                                Text("Christmas")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.top)
                            ForEach(Array(appData.christmasItems.enumerated()), id: \.element.id) { index, item in
                                SpecialAchievementView(item: item, currency: "❄️", completed: appData.completedChristmasAchievements[index])
                            }
                        }
                    }
                } else {
                    VStack {
                        Spacer()
                        Text("You haven't unlocked this Page yet.")
                            .foregroundColor(.secondary)
                            .padding()
                        Spacer()
                    }
                }
            }
        }
    }
}
