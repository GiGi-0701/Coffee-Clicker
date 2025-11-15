//
//  HomeView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 09.09.25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            Text("Coffee")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top)
            if !appData.showWhole {
                Text(appData.formatNumber(appData.score))
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
            } else {
                Text(appData.score.formattedWithDots)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
            }
            if appData.isTextVisible {
                Text("15x Click-Power")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
            Spacer()
            if #available(iOS 26.0, *) {
                Button(action: {
                    appData.score += Double(appData.coffeePerClick) * appData.cpcMultiplier
                    appData.coffeeTotal += Double(appData.coffeePerClick) * appData.cpcMultiplier
                    appData.timesClicked += 1
                }, label: {
                    Image("skin\(appData.skinNum)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 5.0)
                        .frame(width: 135, height: 135)
                })
                .buttonStyle(.glass)
                .padding()
            } else {
                Button(action: {
                    appData.score += Double(appData.coffeePerClick) * appData.cpcMultiplier
                    appData.coffeeTotal += Double(appData.coffeePerClick) * appData.cpcMultiplier
                    appData.timesClicked += 1
                }, label: {
                    Image("skin\(appData.skinNum)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 5.0)
                        .frame(width: 135, height: 135)
                })
                .buttonStyle(.bordered)
                .padding()
            }
            Spacer()
            HStack {
                Text(appData.formatNumberD(appData.cps))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                    .padding([.top, .leading])
                Text("cps")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding([.top, .trailing])
                Spacer()
                if appData.isTextVisible {
                    Text("10x cps")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.trailing)
                }
            }
            HStack {
                Text(appData.formatNumberD(appData.money))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                    .padding([.leading, .bottom])
                Text(" 🪙")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding([.bottom, .trailing])
                Spacer()
                if appData.isTextVisible {
                    Text("\(appData.timeSpecial)s")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.trailing)
                }
            }
            HStack {
                Text(String(format: "%.0f", (appData.reachSpecialProgress - appData.specialProgress)))
                Spacer()
                ProgressView(value: appData.specialProgress, total: appData.reachSpecialProgress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .brown))
                    .scaleEffect(x: 1, y: 3, anchor: .center)
                    .frame(width: 250)
                    .padding(.vertical)
            }
            .padding(.horizontal)
            .background(Rectangle()
                .foregroundColor(.box)
                .cornerRadius(10)
                .shadow(radius: 10)
            )
            .padding([.horizontal, .bottom])
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
}

extension Double {
    var formattedWithDots: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
