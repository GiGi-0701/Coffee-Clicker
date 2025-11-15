//
//  SettingsView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 09.09.25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appData: AppData
    @State private var showResetAlert = false
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.vertical)
            ScrollView {
                VStack {
                    HStack {
                        Text("Ascend")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom)
                        Spacer()
                        Button(action: {
                            appData.isAscendInfo.toggle()
                        }, label: {
                            Image(systemName: "info.square")
                        })
                        .alert(isPresented: $appData.isAscendInfo, content: {
                            Alert(title: Text("How ascending work:"), message: Text("Before you ascend, you have to get a set amount of coffee made, spent and Items bought. After the progress bar has reached 100% you can ascend. !!WARNING!! ASCENDING RESETS ALL OF YOUR STATS (coffee, cps, ...) AND EVERYTHING YOU MADE. So now you might ask yourself why you should ascend. Well, everytime you ascend, your pointer gets 2x better, the items get 2x faster, the upgrades become 2x better and so much more! So if you feel like you've completed everything, try ascending!"))
                        })
                    }
                    ProgressView(value: appData.ascendProgress, total: Double(appData.ascendTotal))
                    HStack {
                        Text(String(format: "%.0f", floor((Double(appData.ascendProgress)/Double(appData.ascendTotal)))*100) + "%")
                        Spacer()
                        Text("100%")
                    }
                    Button(action: {
                        if appData.ascend == true {
                            if appData.money > (Double(appData.priceAscend) - 1) {
                                appData.resetAscend()
                            }
                            else {
                                appData.ascendAlertTitle = "Ascending too expensive!"
                                appData.ascendAlertText = "You don't have enough 🪙 to ascend."
                                appData.isAscendBarDone.toggle()
                            }
                        }
                        else {
                            appData.ascendAlertTitle = "Progress Bar isn't done yet!"
                            appData.ascendAlertText = "You have to wait until the Progress Bar is at 100%."
                            appData.isAscendBarDone.toggle()
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            VStack {
                                Text("Buy")
                                    .fontWeight(.bold)
                                Text("\(appData.formatNumber(Double(appData.priceAscend))) 🪙")
                                    .font(.footnote)
                            }
                            Spacer()
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .alert(appData.ascendAlertTitle, isPresented: $appData.isAscendBarDone) {
                        Button("OK", role: .cancel) {}
                    } message: {
                        Text(appData.ascendAlertText)
                    }
                    Text("You've ascended " + String(appData.timesAscended) + " time/s")
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                HStack {
                    Text("\(appData.pearls) 🦪")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        appData.isPearlInfo.toggle()
                    }, label: {
                        Image(systemName: "info.square")
                    })
                    .alert(isPresented: $appData.isPearlInfo, content: {
                        Alert(title: Text("Pearls 🦪"), message: Text("Pearls are a currency which you can gain from ascending. Everytime you ascend, you gain a Pearl. With those you can unlock stuff like cheaper Prices and faster cps. When you buy something with pearls, you won't lose those pearls."))
                    })
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                HStack {
                    Text("Pin Pages to Tab-Bar")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        appData.pinSheet = true
                        print(appData.conditionViews)
                        print(appData.pinnedConditions)
                    } label: {
                        Text("📌")
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                VStack {
                    HStack {
                        Text("Stats")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom)
                        Spacer()
                        Button(action: {
                            appData.isStatsInfo.toggle()
                        }, label: {
                            Image(systemName: "info.square")
                        })
                        .alert(isPresented: $appData.isStatsInfo, content: {
                            Alert(title: Text("Stats"), message: Text("Here you can see your statistics."))
                        })
                    }
                    List {
                        HStack {
                            Text("Coffee made: ")
                            Spacer()
                            Text("\(appData.formatNumber(Double(appData.coffeeTotal))) ☕️")
                        }
                        HStack {
                            Text("Coffee made offline:")
                            Spacer()
                            Text("\(appData.formatNumber(appData.offlineCoffee)) ☕️")
                        }
                        HStack {
                            Text("Coffee spent: ")
                            Spacer()
                            Text("\(appData.formatNumber(Double(appData.coffeeSpend))) ☕️")
                        }
                        HStack {
                            Text("Button clicked: ")
                            Spacer()
                            Text("\(appData.formatNumber(Double(appData.timesClicked))) time/s")
                        }
                        HStack {
                            Text("Items bought: ")
                            Spacer()
                            Text("\(appData.formatNumber(Double(appData.itemsTotal))) Item/s")
                        }
                        HStack {
                            Text("Ascended: ")
                            Spacer()
                            Text(String(appData.timesAscended) + " time/s")
                        }
                    }
                    .frame(height: 300)
                    .cornerRadius(15)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                HStack {
                    Toggle("Show whole Number on Home Screen", isOn: Binding(
                        get: { appData.fastCPS && appData.showWhole },
                        set: { newValue in
                            appData.fastCPS = newValue
                            appData.showWhole = newValue
                        })
                    )
                    .disabled(appData.score < 1000)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
                Button {
                    appData.newHere = true
                } label: {
                    Text("Guide")
                }
                .padding(.bottom, 10.0)
                Button(role: .destructive) {
                    showResetAlert = true
                } label: {
                    Text("Reset All Progress")
                }
                .alert("Are you sure?", isPresented: $showResetAlert) {
                    Button("Reset", role: .destructive) {
                        appData.reset()
                    }
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("This will delete ALL your progress permanently. This isn't like ascending. You don't gain anything from doing this!")
                }
            }
            Spacer()
        }
        .onAppear(perform: appData.upgrade)
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $appData.pinSheet) {
            PinViews()
        }
    }
}

struct PinViews: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            Text("Pin your three favorite pages to your Tab-Bar!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Spacer()
            ForEach(0..<3, id: \.self) { index in
                HStack {
                    Text("📌 \(index + 1)")
                        .fontWeight(.semibold)
                    Spacer()
                    Picker(selection: Binding(
                        get: {
                            appData.tabViews.firstIndex(where: { $0.name == appData.pinnedViews[index].name }) ?? 0
                        },
                        set: { newIndex in
                            appData.pinnedViews[index] = appData.tabViews[newIndex]
                            appData.pinnedConditions[index] = appData.conditionViews[newIndex]
                        }
                    ), label: pickerLabel(for: appData.pinnedViews[index])) {
                        ForEach(0..<appData.tabViews.count, id: \.self) { i in
                            pickerLabel(for: appData.tabViews[i])
                                .tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.box)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding()
            }
            Spacer()
            Text("Current Setup")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            HStack {
                VStack {
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("Home")
                        .font(.caption)
                        .padding(.top, 5.0)
                }
                .foregroundColor(.gray)
                Spacer()
                VStack {
                    Image(systemName: appData.pinnedViews[0].image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text(appData.pinnedViews[0].name)
                        .font(.caption)
                        .padding(.top, 5.0)
                }
                .foregroundColor(.gray)
                Spacer()
                VStack {
                    Image(systemName: appData.pinnedViews[1].image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text(appData.pinnedViews[1].name)
                        .font(.caption)
                        .padding(.top, 5.0)
                }
                .foregroundColor(.gray)
                Spacer()
                VStack {
                    Image(systemName: appData.pinnedViews[2].image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text(appData.pinnedViews[2].name)
                        .font(.caption)
                        .padding(.top, 5.0)
                }
                .foregroundColor(.gray)
                Spacer()
                VStack {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("More")
                        .font(.caption)
                        .padding(.top, 5.0)
                }
                .foregroundColor(.accentColor)
            }
            .padding()
            .background(Rectangle()
                .foregroundColor(.box)
                .cornerRadius(15)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            )
            .padding()
        }
    }
    
    @ViewBuilder
    func pickerLabel(for item: (view: AnyView, name: String, image: String)) -> some View {
        VStack {
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text(item.name)
        }
    }
}
