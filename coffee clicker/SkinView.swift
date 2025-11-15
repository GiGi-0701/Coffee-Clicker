//
//  SkinView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 28.09.25.
//

import SwiftUI

struct SkinView: View {
    @EnvironmentObject var appData: AppData
    var body: some View {
        VStack {
            HStack {
                Text("Skins")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.vertical)
                Spacer()
                if appData.skinPage == 0 {
                    Text("🍪 \(appData.formatNumber(Double(appData.cookies)))")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.accentColor)
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.box)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        )
                } else if appData.skinPage == 1 {
                    Text("👻 \(appData.formatNumber(Double(appData.ghosts)))")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.orange)
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.box)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        )
                } else if appData.skinPage == 2 {
                    Text("❄️ \(appData.formatNumber(Double(appData.snowflakes)))")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.red)
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.box)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        )
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            Picker("", selection: $appData.skinPage) {
                Text("Skins").tag(0)
                if appData.halloweenUnlocked {
                    Text("Halloween").tag(1)
                } else {
                    Text("???").tag(1)
                }
                if appData.christmasUnlocked {
                    Text("Christmas").tag(2)
                } else {
                    Text("???").tag(2)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            if appData.skinPage == 0 {
                ScrollView {
                    HStack {
                        VStack {
                            Image("skin0")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("0 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin0 == true)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin0 == true {
                                    appData.skinNum = 0
                                }
                            } label: {
                                if appData.skinNum == 0 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 5
                                appData.equipSkin1 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("5 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin1 == true || appData.cookies < 5)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin1 == true {
                                    appData.skinNum = 1
                                }
                            } label: {
                                if appData.skinNum == 1 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                    HStack {
                        VStack {
                            Image("skin2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 6
                                appData.equipSkin2 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("6 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin2 == true || appData.cookies < 6 || appData.equipSkin1 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin2 == true {
                                    appData.skinNum = 2
                                }
                            } label: {
                                if appData.skinNum == 2 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 6
                                appData.equipSkin3 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("6 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin3 == true || appData.cookies < 6 || appData.equipSkin2 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin3 == true {
                                    appData.skinNum = 3
                                }
                            } label: {
                                if appData.skinNum == 3 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                    HStack {
                        VStack {
                            Image("skin4")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 7
                                appData.equipSkin4 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("7 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin4 == true || appData.cookies < 7 || appData.equipSkin3 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin4 == true {
                                    appData.skinNum = 4
                                }
                            } label: {
                                if appData.skinNum == 4 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin5")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 7
                                appData.equipSkin5 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("7 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin5 == true || appData.cookies < 7 || appData.equipSkin4 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin5 == true {
                                    appData.skinNum = 5
                                }
                            } label: {
                                if appData.skinNum == 5 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                    HStack {
                        VStack {
                            Image("skin6")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 8
                                appData.equipSkin6 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("8 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin6 == true || appData.cookies < 8 || appData.equipSkin5 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin6 == true {
                                    appData.skinNum = 6
                                }
                            } label: {
                                if appData.skinNum == 6 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin7")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 8
                                appData.equipSkin7 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("8 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin7 == true || appData.cookies < 8 || appData.equipSkin6 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin7 == true {
                                    appData.skinNum = 7
                                }
                            } label: {
                                if appData.skinNum == 7 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                    HStack {
                        VStack {
                            Image("skin8")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 7
                                appData.equipSkin8 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("7 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin8 == true || appData.cookies < 7 || appData.equipSkin7 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin8 == true {
                                    appData.skinNum = 8
                                }
                            } label: {
                                if appData.skinNum == 8 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin9")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.cookies -= 10
                                appData.equipSkin9 = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("10 🍪")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.equipSkin9 == true || appData.cookies < 10 || appData.equipSkin8 == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.equipSkin9 == true {
                                    appData.skinNum = 9
                                }
                            } label: {
                                if appData.skinNum == 9 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                }
                .padding(.vertical)
                .background(
                    Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                )
                .padding()
            } else if appData.skinPage == 1 && appData.halloweenUnlocked {
                ScrollView {
                    HStack {
                        VStack {
                            Image("skin1001")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.ghosts -= 1
                                appData.halloweenSkins[0] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 👻")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.halloweenSkins[0] == true || appData.ghosts < 1)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.halloweenSkins[0] {
                                    appData.skinNum = 1001
                                }
                            } label: {
                                if appData.skinNum == 1001 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin1002")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.ghosts -= 1
                                appData.halloweenSkins[1] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 👻")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.halloweenSkins[1] == true || appData.ghosts < 1 || appData.halloweenSkins[0] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.halloweenSkins[1] == true {
                                    appData.skinNum = 1002
                                }
                            } label: {
                                if appData.skinNum == 1002 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                    HStack {
                        VStack {
                            Image("skin1003")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.ghosts -= 1
                                appData.halloweenSkins[2] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 👻")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.halloweenSkins[2] == true || appData.ghosts < 1 || appData.halloweenSkins[1] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.halloweenSkins[2] {
                                    appData.skinNum = 1003
                                }
                            } label: {
                                if appData.skinNum == 1003 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin1004")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.ghosts -= 1
                                appData.halloweenSkins[3] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 👻")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.halloweenSkins[3] == true || appData.ghosts < 1 || appData.halloweenSkins[2] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.halloweenSkins[3] == true {
                                    appData.skinNum = 1004
                                }
                            } label: {
                                if appData.skinNum == 1004 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                }
                .tint(.orange)
                .padding(.vertical)
                .background(
                    Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                )
                .padding()
            } else if appData.skinPage == 1 {
                ScrollView {
                    HStack {
                        Spacer()
                        Text("You haven't unlocked this Page yet.")
                            .foregroundColor(.secondary)
                            .padding()
                        Spacer()
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
            } else if appData.skinPage == 2 && appData.christmasUnlocked {
                ScrollView {
                    HStack {
                        VStack {
                            Image("skin1201")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.snowflakes -= 1
                                appData.christmasSkins[0] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 ❄️")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.christmasSkins[0] == true || appData.snowflakes < 1)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.christmasSkins[0] {
                                    appData.skinNum = 1201
                                }
                            } label: {
                                if appData.skinNum == 1201 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin1202")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.snowflakes -= 1
                                appData.christmasSkins[1] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 ❄️")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.christmasSkins[1] == true || appData.snowflakes < 1 || appData.christmasSkins[0] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.christmasSkins[1] == true {
                                    appData.skinNum = 1202
                                }
                            } label: {
                                if appData.skinNum == 1202 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                    HStack {
                        VStack {
                            Image("skin1203")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.snowflakes -= 1
                                appData.christmasSkins[2] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 ❄️")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.christmasSkins[2] == true || appData.snowflakes < 1 || appData.christmasSkins[1] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.christmasSkins[2] {
                                    appData.skinNum = 1203
                                }
                            } label: {
                                if appData.skinNum == 1203 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin1204")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.snowflakes -= 1
                                appData.christmasSkins[3] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 ❄️")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.christmasSkins[3] == true || appData.snowflakes < 1 || appData.christmasSkins[2] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.christmasSkins[3] == true {
                                    appData.skinNum = 1204
                                }
                            } label: {
                                if appData.skinNum == 1204 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                    HStack {
                        VStack {
                            Image("skin1205")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.snowflakes -= 1
                                appData.christmasSkins[4] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 ❄️")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.christmasSkins[4] == true || appData.snowflakes < 1 || appData.christmasSkins[3] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.christmasSkins[4] {
                                    appData.skinNum = 1205
                                }
                            } label: {
                                if appData.skinNum == 1205 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                        VStack {
                            Image("skin1206")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 75)
                            Button {
                                appData.snowflakes -= 1
                                appData.christmasSkins[5] = true
                            } label: {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("Buy")
                                            .font(.footnote)
                                        Text("1 ❄️")
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                            .disabled(appData.christmasSkins[5] == true || appData.snowflakes < 1 || appData.christmasSkins[4] == false)
                            .buttonStyle(.borderedProminent)
                            Button {
                                if appData.christmasSkins[5] == true {
                                    appData.skinNum = 1206
                                }
                            } label: {
                                if appData.skinNum == 1206 {
                                    Text("Equipped")
                                } else {
                                    Text("Equip")
                                }
                            }
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.box)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        .padding()
                    }
                    .padding()
                }
                .tint(.red)
                .padding(.vertical)
                .background(
                    Rectangle()
                        .foregroundColor(.box)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                )
                .padding()
            } else if appData.skinPage == 2 {
                ScrollView {
                    HStack {
                        Spacer()
                        Text("You haven't unlocked this Page yet.")
                            .foregroundColor(.secondary)
                            .padding()
                        Spacer()
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
}
