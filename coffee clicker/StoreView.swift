//
//  StoreView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 09.09.25.
//

import SwiftUI

// MARK: Reusable store item view
struct StoreItemView: View {
    let item: StoreItem
    let itemCPS: Double
    let itemPrice: Double
    let cantBuy: Bool
    let itemAmount: Int
    let buyItem: () -> Void
    let formatNumber: (Double) -> String
    let formatNumberD: (Double) -> String
    
    var body: some View {
        VStack {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .drawingGroup()
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Text(item.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Spacer()
                        Text(formatNumberD(itemCPS) + " cps")
                    }
                }
            }
            Text("«\(item.description)»")
                .font(.footnote)
                .fontWeight(.light)
            Button(action: {
                buyItem()
            }) {
                HStack {
                    Spacer()
                    VStack {
                        Text("Buy")
                            .fontWeight(.bold)
                        Text("☕️ \(formatNumber(itemPrice))")
                            .font(.footnote)
                    }
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(cantBuy)
            Text("You've bought \(formatNumber(Double(itemAmount)))")
                .padding(.top)
        }
            .padding()
            .background(Rectangle()
                .foregroundColor(.box)
                .cornerRadius(15)
                .shadow(radius: 10)
            )
            .padding()
            .compositingGroup()
    }
}

// MARK: Store View with ScrollView + loop
struct StoreView: View {
    @EnvironmentObject var appData: AppData
    let items = [
        StoreItem(imageName: "store-item-1", name: "Broken Coffee machine", description: "A Broken Coffee machine you found on the side of the road."),
        StoreItem(imageName: "store-item-2", name: "Moka", description: "A decent moka you found on Ebay."),
        StoreItem(imageName: "store-item-3", name: "New Coffee machine", description: "A New Coffee machine you found on amazon."),
        StoreItem(imageName: "store-item-4", name: "Sugar", description: "Sweet sugar, that you bought in your local supermarket."),
        StoreItem(imageName: "store-item-5", name: "Milk", description: "Fresh milk, that you bought in your local supermarket."),
        StoreItem(imageName: "store-item-6", name: "Coffee Beans", description: "Delicious Coffee Beans you borrowed from StarBucks."),
        StoreItem(imageName: "store-item-7", name: "Grandmother", description: "Your 80 Year old Grandmother, who loves making coffee for her grandchild."),
        StoreItem(imageName: "store-item-8", name: "Golden coffee machine", description: "A rare Golden Coffee machine you bought in an auction."),
        StoreItem(imageName: "store-item-9", name: "Golden Moka", description: "A rare Golden Moka you bought in an auction."),
        StoreItem(imageName: "store-item-10", name: "Coffee Shop", description: "You opened your own coffee shop!"),
        StoreItem(imageName: "store-item-11", name: "Employee", description: "An employee who works at your coffee shop."),
        StoreItem(imageName: "store-item-12", name: "Barista", description: "A barista who works at your coffee shop."),
        StoreItem(imageName: "store-item-13", name: "Coffee Chef", description: "A Coffee Chef who works at your coffee shop."),
        StoreItem(imageName: "store-item-14", name: "Coffee Factory", description: "You opened a Coffee Factory!"),
        StoreItem(imageName: "store-item-15", name: "Factory Worker", description: "A Factory Worker who works at your Factory.")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Store")
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
                    VStack(spacing: 16) {
                        if appData.halloween && !appData.halloweenUnlocked {
                            VStack {
                                HStack {
                                    Image("halloweenItem")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .drawingGroup()
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("Halloween Special")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.trailing)
                                        }
                                        HStack {
                                            Spacer()
                                            Text("+1 👻")
                                        }
                                    }
                                }
                                Text("«Unlock the 'Halloween' section in the Skins Page»")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                Button(action: {
                                    appData.score -= 1
                                    appData.ghosts += 1
                                    appData.halloweenUnlocked = true
                                }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Text("Buy")
                                                .fontWeight(.bold)
                                            Text("☕️ 1")
                                                .font(.footnote)
                                        }
                                        Spacer()
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .disabled(appData.score < 1 || appData.halloweenUnlocked)
                                .tint(.orange)
                            }
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                            )
                            .padding()
                        }
                        if appData.christmas && !appData.christmasUnlocked {
                            VStack {
                                HStack {
                                    Image("christmasItem")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .drawingGroup()
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("Christmas Special")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.trailing)
                                        }
                                        HStack {
                                            Spacer()
                                            Text("+1 ❄️")
                                        }
                                    }
                                }
                                Text("«Unlock the 'Christmas' section in the Skins Page»")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                Button(action: {
                                    appData.score -= 1
                                    appData.snowflakes += 1
                                    appData.christmasUnlocked = true
                                }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Text("Buy")
                                                .fontWeight(.bold)
                                            Text("☕️ 1")
                                                .font(.footnote)
                                        }
                                        Spacer()
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .disabled(appData.score < 1 || appData.christmasUnlocked)
                                .tint(.red)
                            }
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                            )
                            .padding()
                        }
                        ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                           StoreRow(index: index, item: item)
                        }
                    }
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        }
        .navigationViewStyle(.stack)
    }
}

struct StoreRow: View {
    let index: Int
    @EnvironmentObject var appData: AppData
    let item: StoreItem
    
    var body: some View {
        let cantBuy = appData.score < appData.prices[index]
        let itemCPS = appData.cpsPerItem[index]
        let itemPrice = appData.prices[index]
        let itemAmount = appData.amounts[index]
        let buyItem = { appData.buyItem(at: index) }
        let formatNumber = appData.formatNumber
        let formatNumberD = appData.formatNumberD
        
        StoreItemView(
            item: item,
            itemCPS: itemCPS,
            itemPrice: itemPrice,
            cantBuy: cantBuy,
            itemAmount: itemAmount,
            buyItem: buyItem,
            formatNumber: formatNumber,
            formatNumberD: formatNumberD
        )
    }
}
