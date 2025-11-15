//
//  CoffeeShopView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 29.09.25.
//

import SwiftUI

// MARK: Reusable store item view
struct CoffeeShopReusableView: View {
    @EnvironmentObject var appData: AppData
    @EnvironmentObject var coffeeShopItem: AppData
    let item: CoffeeShopItem
    let index: Int
    
    var body: some View {
        Button(action: {
            appData.money -= item.price
            appData.score += item.coffee
        }) {
            HStack {
                Text("☕️ \(appData.formatNumber(item.coffee))")
                    .fontWeight(.semibold)
                Spacer()
                Text("$ \(appData.formatNumber(item.price))")
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10.0)
        }
        .padding(.horizontal)
        .buttonStyle(.borderedProminent)
        .tint(.brown)
        .shadow(radius: 5)
        .disabled(appData.money < item.price)
    }
}

struct CoffeeShopView: View {
    @EnvironmentObject var appData: AppData
    let items = [
        CoffeeShopItem(coffee: 1e2, price: 1e1),
        CoffeeShopItem(coffee: 1e4, price: 1e3),
        CoffeeShopItem(coffee: 1e6, price: 1e5),
        CoffeeShopItem(coffee: 1e9, price: 1e8),
        CoffeeShopItem(coffee: 1e12, price: 1e11),
        CoffeeShopItem(coffee: 1e15, price: 1e14),
        CoffeeShopItem(coffee: 1e18, price: 1e17),
        CoffeeShopItem(coffee: 1e21, price: 1e20),
        CoffeeShopItem(coffee: 1e24, price: 1e23),
        CoffeeShopItem(coffee: 1e27, price: 1e26),
        CoffeeShopItem(coffee: 1e30, price: 1e29),
        CoffeeShopItem(coffee: 1e33, price: 1e32),
        CoffeeShopItem(coffee: 1e36, price: 1e35),
        CoffeeShopItem(coffee: 1e39, price: 1e38),
        CoffeeShopItem(coffee: 1e42, price: 1e41),
        CoffeeShopItem(coffee: 1e45, price: 1e44),
        CoffeeShopItem(coffee: 1e48, price: 1e47),
        CoffeeShopItem(coffee: 1e51, price: 1e50),
        CoffeeShopItem(coffee: 1e54, price: 1e53),
        CoffeeShopItem(coffee: 1e57, price: 1e56),
        CoffeeShopItem(coffee: 1e60, price: 1e59)
    ]
    
    var body: some View {
        VStack {
            Text("Store")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top)
            HStack {
                Text("☕️ \(appData.formatNumber(appData.score))")
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.brown)
                        .cornerRadius(10)
                    )
                Spacer()
                Text("$ \(appData.formatNumberD(appData.money))")
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.brown)
                        .cornerRadius(10)
                    )
            }
            .padding(.horizontal)
            ScrollView {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    CoffeeShopReusableView(item: item, index: index)
                }
            }
            .padding(.vertical)
            .background(
                Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            )
            .padding()
        }
    }
}
