//
//  UpgradeView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 10.09.25.
//

import SwiftUI

struct UpgradeItemView: View {
    let item: StoreItem
    let itemCPS: Double
    let upgradePrice: Double
    let cantUpgrade: Bool
    let upgradeAmount: Int
    let upgradeItem: () -> Void
    let formatNumber: (Double) -> String
    let formatNumberD: (Double) -> String
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .drawingGroup()
            Text(item.name)
                .font(.title3)
                .fontWeight(.bold)
            Text("\(formatNumberD(itemCPS)) cps")
            Button(action: {
                upgradeItem()
            }) {
                HStack {
                    Spacer()
                    VStack {
                        Text("Upgrade")
                            .fontWeight(.bold)
                        Text("☕️ \(formatNumber(Double(upgradePrice)))")
                            .font(.footnote)
                    }
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(cantUpgrade)
            Text("You've upgraded \(formatNumber(Double(upgradeAmount))) time/s")
                .padding(.top)
        }
            .padding()
            .background(Rectangle()
                .foregroundColor(.box)
                .cornerRadius(15)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            )
            .padding()
            .compositingGroup()
    }
}

struct UpgradeView: View {
    @EnvironmentObject var appData: AppData
    let items = [
        StoreItem(imageName: "store-item-1", name: "Broken Coffee machine", description: ""),
        StoreItem(imageName: "store-item-2", name: "Moka", description: ""),
        StoreItem(imageName: "store-item-3", name: "New Coffee machine", description: ""),
        StoreItem(imageName: "store-item-4", name: "Sugar", description: ""),
        StoreItem(imageName: "store-item-5", name: "Milk", description: ""),
        StoreItem(imageName: "store-item-6", name: "Coffee Beans", description: ""),
        StoreItem(imageName: "store-item-7", name: "Grandmother", description: ""),
        StoreItem(imageName: "store-item-8", name: "Golden coffee machine", description: ""),
        StoreItem(imageName: "store-item-9", name: "Golden Moka", description: ""),
        StoreItem(imageName: "store-item-10", name: "Coffee Shop", description: ""),
        StoreItem(imageName: "store-item-11", name: "Employee", description: ""),
        StoreItem(imageName: "store-item-12", name: "Barista", description: ""),
        StoreItem(imageName: "store-item-13", name: "Coffee Chef", description: ""),
        StoreItem(imageName: "store-item-14", name: "Coffee Factory", description: ""),
        StoreItem(imageName: "store-item-15", name: "Factory Worker", description: "")
    ]
    
    var body: some View {
        VStack {
            Text("Upgrade")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.vertical)
            HStack {
                Text("☕️ \(appData.formatNumber(appData.score))")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    )
                Spacer()
                Text("\(appData.formatNumberD(appData.cps)) cps")
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
            ScrollView {
                VStack {
                    Image("store-item-0")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    Text("Cursor")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("\(appData.formatNumber(Double(appData.coffeePerClick))) ☕️ per click.")
                    Button(action: {
                        appData.upgradeCursor()
                    }) {
                        HStack {
                            Spacer()
                            VStack {
                                Text("Upgrade")
                                    .fontWeight(.bold)
                                Text("☕️ \(appData.formatNumber(Double(appData.cursorPrice)))")
                                    .font(.footnote)
                            }
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(appData.score < Double(appData.cursorPrice))
                    Text("You've upgraded \(appData.formatNumber(Double(appData.cursorAmount))) time/s")
                        .padding(.top)
                }
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(15)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    )
                    .padding()
                VStack(spacing: 16) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        UpgradeRow(index: index, item: item)
                    }
                }
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
}

struct UpgradeRow: View {
    let index: Int
    @EnvironmentObject var appData: AppData
    let item: StoreItem
    
    var body: some View {
        let itemCPS = appData.cpsPerItem[index]
        let upgradePrice = appData.upgradePrices[index]
        let cantUpgrade = appData.score < appData.upgradePrices[index]
        let upgradeAmount = appData.amountUpgrade[index]
        let upgradeItem = { appData.upgradeItem(at: index) }
        let formatNumber = appData.formatNumber
        let formatNumberD = appData.formatNumberD
        
        UpgradeItemView(
            item: item,
            itemCPS: itemCPS,
            upgradePrice: upgradePrice,
            cantUpgrade: cantUpgrade,
            upgradeAmount: upgradeAmount,
            upgradeItem: upgradeItem,
            formatNumber: formatNumber,
            formatNumberD: formatNumberD
        )
    }
}
