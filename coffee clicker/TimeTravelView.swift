//
//  TimeTravelView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 01.10.25.
//

import SwiftUI

// MARK: Reusable store item view
struct TimeTravelReusableView: View {
    @EnvironmentObject var appData: AppData
    let index: Int
    
    var body: some View {
        Button(action: {
            appData.clocks -= appData.timeTravelPrices[index]
            appData.score += appData.cps * Double(appData.clockPower) * Double(appData.timeTravelMultiplier[index])
        }) {
            HStack {
                Text("☕️ \(appData.formatNumber(appData.cps * Double(appData.clockPower) * Double(appData.timeTravelMultiplier[index])))")
                    .fontWeight(.semibold)
                Spacer()
                Text("⌚️ \(appData.timeTravelPrices[index])")
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10.0)
        }
        .padding(.horizontal)
        .buttonStyle(.borderedProminent)
        .tint(.blue)
        .shadow(radius: 5)
        .disabled(appData.clocks < appData.timeTravelPrices[index])
    }
}

struct TimeTravelView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            Text("Time Travel")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.vertical)
            HStack {
                Text("⌚️ \(appData.clocks)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    )
                Spacer()
                Text("\(appData.formatNumberD(appData.money)) 🪙")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    )
            }
            .padding(.horizontal)
            Button(action: {
                appData.clocks += 1
                appData.money -= appData.clockPrice
                appData.clockPrice *= 1e3
            }) {
                HStack {
                    Text("⌚️ 1")
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(appData.formatNumberD(appData.clockPrice)) 🪙")
                        .fontWeight(.bold)
                }
                .padding(.vertical, 10.0)
            }
            .padding(.horizontal)
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .shadow(radius: 5)
            .disabled(appData.money < appData.clockPrice)
            ScrollView {
                ForEach(0..<appData.timeTravelPrices.count, id: \.self) { index in
                    TimeTravelReusableView(index: index)
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
