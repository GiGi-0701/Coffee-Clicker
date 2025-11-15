//
//  ContentView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 04.09.25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    @State private var showStartAlert = false
    
    var body: some View {
            TabView {
                HomeView().tabItem {
                    Image(systemName: "cup.and.saucer.fill")
                    Text("Home")
                }
                // PINNED VIEWS
                if appData.pinnedConditions[0] {
                    Group {
                        appData.pinnedViews[0].view.tabItem {
                            Image(systemName: appData.pinnedViews[0].image)
                            Text(appData.pinnedViews[0].name)
                        }
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.pinnedConditions[1] {
                    appData.pinnedViews[1].view.tabItem {
                        Image(systemName: appData.pinnedViews[1].image)
                        Text(appData.pinnedViews[1].name)
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.pinnedConditions[2] {
                    appData.pinnedViews[2].view.tabItem {
                        Image(systemName: appData.pinnedViews[2].image)
                        Text(appData.pinnedViews[2].name)
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                // ALL VIEWS
                if appData.coffeeTotal >= 25 {
                    StoreView().tabItem {
                        Image(systemName: "storefront.fill")
                        Text("Store")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.itemsTotal >= 50 {
                    SellingView().tabItem {
                        Image(systemName: "dollarsign.square.fill")
                        Text("Selling")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.timesClicked >= 100 {
                    UpgradeView().tabItem {
                        Image(systemName: "arrow.up.square.fill")
                        Text("Upgrades")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.cookies >= 5 || appData.equipSkin1 == true {
                    SkinView().tabItem {
                        Image(systemName: "cup.and.heat.waves.fill")
                        Text("Skins")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.coffeeSpend >= 1000 {
                    CoffeeShopView().tabItem {
                        Image(systemName: "creditcard.fill")
                        Text("Coffee-Shop")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.timesAscended >= 1 {
                    PearlView().tabItem {
                        Image(systemName: "diamond.fill")
                        Text("Pearl-Shop")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.offlineCoffee >= 1e9 {
                    TimeTravelView().tabItem {
                        Image(systemName: "clock.fill")
                        Text("Time Travel")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                if appData.halloween || appData.christmas {
                    SpecialView().tabItem {
                        Image(systemName: "fireworks")
                        Text("Specials")
                    }
                }
                if appData.coffeeTotal >= 1 {
                    AchievementView().tabItem {
                        Image(systemName: "star.fill")
                        Text("Achievements")
                    }
                } else {
                    NotAvailableView().tabItem {
                        Image(systemName: "questionmark.app.fill")
                        Text("???")
                    }
                }
                SettingsView().tabItem {
                    Image(systemName: "gear.badge")
                    Text("Settings")
                }
            }
            .onAppear {
                if appData.cps > 1 {
                    showStartAlert = true
                }
            }
            .alert("Welcome Back!", isPresented: $showStartAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("You've made \(appData.formatNumber(appData.offlineEarnings)) ☕️ while you were gone.")
            }
            .alert("Welcome to Coffee Clicker!", isPresented: $appData.firstAlert) {
                    Button("I've played before", role: .cancel) {}
                Button("I'm new here") {appData.newHere = true}
            } message: {
                Text("Remember to go to Settings and Reset All Progress before playing!")
            }
            .alert("Special Event! 🎉", isPresented: $appData.specialAlert) {
                Button("OK", role: .cancel) {
                    appData.SpecialEvent()
                }
            } message: {
                Text("Your cps is now 10x stronger and your clicks are now 15x stronger! This will last for 30s! Click as fast as you can!")
            }
            .onReceive(appData.timer) { _ in appData.timerFunc()}
            .onReceive(appData.cpsTimer) { _ in appData.cpsTimerFunc()}
            .sheet(isPresented: $appData.newHere) {
                NewHere()
            }
    }
}

struct NewHere: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            HStack {
                Text("☕️")
                Spacer()
                Text("How Coffe Clicker works!")
                Spacer()
                Text("☕️")
            }
            .padding()
            .font(.title)
            .fontWeight(.black)
            ScrollView {
                VStack {
                    Text("Home Page")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            appData.score += Double(appData.coffeePerClick) * appData.cpcMultiplier
                            appData.coffeeTotal += Double(appData.coffeePerClick) * appData.cpcMultiplier
                        }, label: {
                            Image("skin\(appData.skinNum)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 5.0)
                                .frame(width: 75, height: 75)
                        })
                        .buttonStyle(.bordered)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Main Button")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Everytime you click this button, you'll get coffee!")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                    ProgressView(value: appData.specialProgress, total: appData.reachSpecialProgress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .brown))
                        .scaleEffect(x: 1, y: 3, anchor: .center)
                        .padding(.top)
                    VStack(alignment: .leading) {
                        Text("Special Event 🎉")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.top, 10.0)
                        Text("Once the progress bar is completed, a special event will happen.")
                            .font(.subheadline)
                            .fontWeight(.light)
                        Text("The Special Event multiplies your cps (Coffee per second) by 10 and your Click-Power by 15.")
                            .font(.footnote)
                            .fontWeight(.thin)
                    }
                    .padding(.bottom)
                    
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("The Store")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Image("store-item-1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Items")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Everytime you buy an Item, it gives you cps.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                    
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Selling")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Image("skin\(appData.skinNum)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Selling Coffee")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("For each coffee you sell, you get coins.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                    HStack {
                        Image("store-item-2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Selling Items")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("For each item you sell, you get 10% of the original price in coins.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Upgrading")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Image("store-item-0")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Cursor")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Everytime you upgrade your Cursor, your Click-Power gets stronger.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                    HStack {
                        Image("store-item-3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Items")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Everytime you upgrade an Item, the cps of that Item gets stronger.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                    
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Coffee-Shop")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Image("skin0")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Buy Coffee")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("In the Coffee-Shop, you can buy Coffee for coins.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Pearl-Shop")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Text("🦪")
                            .font(.custom("TextToImage", size: 75))
                            .padding(.trailing)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Buy Special Upgrades")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Buy Special Upgrades like 50% cheaper prices in store, by using a special currency called pearls, which you earn from ascending.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Skins")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Image("skin1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Buy Skins")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Buy a Skin using 🍪.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Time Travel")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Text("⌚️")
                            .font(.custom("TextToImage", size: 75))
                            .padding(.trailing)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Travel through Time")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Buy clocks which you can use to get the coffee you would've gotten during a specific time. (Each clock is worth 30 minutes.)")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Achievements")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Text("🍪")
                            .font(.custom("TextToImage", size: 75))
                            .padding(.trailing)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Earn Achievements")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Everytime you earn an Achievement, you'll get a set Amount of 🍪.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    Text("Ascending")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Text("⚙️")
                            .font(.custom("TextToImage", size: 75))
                            .padding(.trailing)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Reset everything")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Everytime you ascend, you'll lose all your progress. In return you get nice perks like twice the click-Power, twice the cps of Items, and a special currency 🦪.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppData())
}
