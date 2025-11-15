//
//  PearlView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 04.09.25.
//

import SwiftUI

struct PearlView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            HStack {
                Text("Pearl-Shop")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.vertical)
                Spacer()
                Text("🦪 \(appData.formatNumber(Double(appData.pearls)))")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.purple)
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    )
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            if appData.brewing {
                VStack {
                    Text("You are currently brewing!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ProgressView(value: Double(appData.brewingTimer), total: Double(appData.brewTime))
                        .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                    HStack {
                        if appData.brewingTimer < 60 {
                            Text("\(appData.brewingTimer) s")
                        } else if appData.brewingTimer < 3600 {
                            Text(String(floor(Double(appData.brewingTimer)/60)) + " m")
                        } else {
                            Text(String(format: "%.2f", (Double(appData.brewingTimer)/60)/60) + " h")
                        }
                        Spacer()
                        if appData.brewTime < 60 {
                            Text("\(appData.brewTime) s")
                        } else if appData.brewTime < 3600 {
                            Text(String(floor(Double(appData.brewingTimer)/60)) + " m")
                        } else {
                            Text(String(format: "%.2f", (Double(appData.brewTime)/60)/60) + " h")
                        }
                    }
                }
                .padding()
            }
            ScrollView {
                Button(action: {
                    appData.brewTime = 180
                    appData.brewing = true
                    appData.startBrewingActivity(name: "Test Activity", totalTime: appData.brewTime)
                }) {
                    HStack {
                        Text("Test")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("🦪 0")
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10.0)
                }
                .padding(.horizontal)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .shadow(radius: 5)
                .disabled(appData.brewing)
                
                Button(action: {
                    appData.caseNum = 1
                    appData.brewTime = 5400
                    appData.brewing = true
                }) {
                    HStack {
                        Text("50% Sale in the Store")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("🦪 \(appData.formatNumber(Double(appData.pearlPrice1)))")
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10.0)
                }
                .padding(.horizontal)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .shadow(radius: 5)
                .disabled(appData.pearls < appData.pearlPrice1 || appData.brewing)
                Button(action: {
                    appData.caseNum = 2
                    appData.brewTime = 9000
                    appData.brewing = true
                }) {
                    HStack {
                        Text("50% cheaper when upgrading")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("🦪 \(appData.formatNumber(Double(appData.pearlPrice2)))")
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10.0)
                }
                .padding(.horizontal)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .shadow(radius: 5)
                .disabled(appData.pearls < appData.pearlPrice2 || appData.brewing)
                Button(action: {
                    appData.caseNum = 3
                    appData.brewTime = 10800
                    appData.brewing = true
                }) {
                    HStack {
                        Text("2x Price when Selling")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("🦪 \(appData.formatNumber(Double(appData.pearlPrice3)))")
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10.0)
                }
                .padding(.horizontal)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .shadow(radius: 5)
                .disabled(appData.pearls < appData.pearlPrice3 || appData.brewing)
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
