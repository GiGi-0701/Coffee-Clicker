//
//  SpecialView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 29.10.25.
//

import SwiftUI

struct SpecialView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            Picker("", selection: $appData.specialPage) {
                if appData.halloweenUnlocked {
                    Text("Halloween").tag(0)
                } else {
                    Text("???").tag(0)
                }
                if appData.christmasUnlocked {
                    Text("Christmas").tag(1)
                } else {
                    Text("???").tag(1)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            if appData.specialStorePage == 0 {
                if appData.specialPage == 0 && appData.halloweenUnlocked {
                    HStack {
                        Text(String(format: "%.2f", appData.pumpkins))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        Spacer()
                        Text("🎃")
                            .font(.title)
                    }
                    .padding([.top, .horizontal])
                    HStack {
                        Text(String(format: "%.3f", appData.pps))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        Spacer()
                        Text("🎃/s")
                    }
                    .padding([.bottom, .horizontal])
                    Divider()
                        .padding(.horizontal)
                    Spacer()
                    Button {
                        appData.pumpkins += 0.01
                    } label: {
                        Image("halloweenBtn")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all, 5.0)
                            .frame(width: 135, height: 135)
                    }
                    .buttonStyle(.bordered)
                    
                }
            } else if appData.specialStorePage == 1 {
                if appData.specialPage == 0 && appData.halloweenUnlocked {
                    Text("Store")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.vertical)
                    ScrollView {
                        VStack(spacing: 16) {
                            if appData.ghostAmount < 2 {
                                HStack {
                                    Text("1 👻")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Button {
                                        appData.pumpkins -= 100
                                        appData.ghosts += 1
                                        appData.ghostAmount += 1
                                    } label: {
                                        VStack {
                                            Text("Buy")
                                                .fontWeight(.bold)
                                            Text("100 🎃")
                                                .font(.footnote)
                                        }
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .tint(.orange)
                                    .disabled(appData.pumpkins < 100)
                                }
                                .padding(10)
                                .background(Rectangle()
                                    .foregroundColor(.box)
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                                )
                                .padding()
                                Divider()
                                    .padding(.horizontal)
                            }
                            VStack {
                                HStack {
                                    Image("halloween-item-1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .drawingGroup()
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("A haunted house")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.trailing)
                                        }
                                        HStack {
                                            Spacer()
                                            Text("0.001 🎃/s")
                                        }
                                    }
                                }
                                Text("«A haunted house where you can carve your pumpkins in peace.»")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                Button(action: {
                                    appData.pumpkins -= 0.25
                                    appData.pps += 0.001
                                    appData.halloweenStoreAmounts[0] += 1
                                }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Text("Buy")
                                                .fontWeight(.bold)
                                            Text("🎃 0.25")
                                                .font(.footnote)
                                        }
                                        Spacer()
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .disabled(appData.pumpkins < 0.25)
                                .tint(.orange)
                            }
                                .padding()
                                .background(Rectangle()
                                    .foregroundColor(.box)
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                                )
                                .padding()
                            VStack {
                                HStack {
                                    Image("halloween-item-2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .drawingGroup()
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("Ghost")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.trailing)
                                        }
                                        HStack {
                                            Spacer()
                                            Text("0.01 🎃/s")
                                        }
                                    }
                                }
                                Text("«A ghost who will steal pumpkins from your neighbors.»")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                Button(action: {
                                    appData.pumpkins -= 2
                                    appData.pps += 0.01
                                    appData.halloweenStoreAmounts[1] += 1
                                }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Text("Buy")
                                                .fontWeight(.bold)
                                            Text("🎃 2")
                                                .font(.footnote)
                                        }
                                        Spacer()
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .disabled(appData.pumpkins < 2)
                                .tint(.orange)
                            }
                                .padding()
                                .background(Rectangle()
                                    .foregroundColor(.box)
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                                )
                                .padding()
                            VStack {
                                HStack {
                                    Image("halloween-item-3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .drawingGroup()
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("Witch")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.trailing)
                                        }
                                        HStack {
                                            Spacer()
                                            Text("0.5 🎃/s")
                                        }
                                    }
                                }
                                Text("«A witch who will make your pumpkins taste better then ever.»")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                Button(action: {
                                    appData.pumpkins -= 50
                                    appData.pps += 0.5
                                    appData.halloweenStoreAmounts[2] += 1
                                }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Text("Buy")
                                                .fontWeight(.bold)
                                            Text("🎃 50")
                                                .font(.footnote)
                                        }
                                        Spacer()
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .disabled(appData.pumpkins < 50)
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
                    }
                }
            }
            Spacer()
            Picker("", selection: $appData.specialStorePage) {
                Text("Home").tag(0)
                Text("Store").tag(1)
            }
            .pickerStyle(.segmented)
            .padding([.horizontal, .bottom])
        }
    }
}
