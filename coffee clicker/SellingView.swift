//
//  SellingView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 09.09.25.
//

import SwiftUI

// MARK: Reusable sell item view
struct SellItemView: View {
    let item: StoreItem
    let itemCPS: Double
    @Binding var sellAmount: Int
    let itemAmount: Int
    let sellPrice: Double
    let sellItem: () -> Void
    let formatNumber: (Double) -> String
    let formatNumberD: (Double) -> String
    
    var body: some View {
        // Item Selling | script
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
            HStack {
                Text("Amount: \(formatNumber(Double(sellAmount))) Products")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Stepper("", value: $sellAmount, in: 0...itemAmount)
            }
            Button(action: {
                sellItem()
            }, label: {
                HStack {
                    Spacer()
                    VStack {
                        Text("Sell")
                            .fontWeight(.bold)
                        Text("\(formatNumberD(sellPrice)) 🪙 for each Product")
                            .font(.footnote)
                    }
                    Spacer()
                }
            })
            .buttonStyle(.borderedProminent)
            .disabled(itemAmount == 0)
            Text("You currently have \(formatNumber(Double(itemAmount)))")
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

// MARK: Selling View with ScrollView + loop
struct SellingView: View {
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
            Text("Selling")
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
            .padding(.bottom)
            ScrollView {
                // Coffee Selling | title + script
                HStack {
                    Text("Sell your Coffee.")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                    Spacer()
                }
                VStack {
                    HStack {
                        VStack {
                            HStack {
                                Text("Amount:")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            HStack {
                                Text("\(appData.formatNumber(Double(appData.amountCoffeeSell))) ☕️")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                        }
                        Spacer()
                        Stepper("", value: $appData.amountCoffeeSell, in: 0...Int(appData.score), step: Int.Stride(appData.coffeeSteps))
                    }
                    Button(action: {
                        appData.score -= Double(appData.amountCoffeeSell)
                        appData.money += appData.pricePerCoffeeSell * Double(appData.amountCoffeeSell)
                        appData.amountCoffeeSell = 0
                    }, label: {
                        HStack {
                            Spacer()
                            VStack {
                                Text("Sell")
                                    .fontWeight(.bold)
                                Text("\(appData.formatNumberD(appData.pricePerCoffeeSell)) 🪙 for each ☕️")
                                    .font(.footnote)
                            }
                            Spacer()
                        }
                    })
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                )
                .padding()
                // Item Selling | title
                HStack {
                    Text("Sell your Products.")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding([.top, .leading])
                    Spacer()
                }
                // Item Selling | reusable VStack
                VStack(spacing: 16) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        SellRow(index: index, item: item)
                    }
                }
            }
            Spacer()
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
}

struct SellRow: View {
    let index: Int
    @EnvironmentObject var appData: AppData
    let item: StoreItem
    
    var body: some View {
        let itemCPS = appData.cpsPerItem[index]
        let itemAmount = appData.amounts[index]
        let sellPrice = appData.sellPrices[index]
        let sellItem = { appData.sellItem(at: index) }
        let formatNumber = appData.formatNumber
        let formatNumberD = appData.formatNumberD
        
        SellItemView(
            item: item,
            itemCPS: itemCPS,
            sellAmount: $appData.amountsToSell[index],
            itemAmount: itemAmount,
            sellPrice: sellPrice,
            sellItem: sellItem,
            formatNumber: formatNumber,
            formatNumberD: formatNumberD
        )
    }
}
