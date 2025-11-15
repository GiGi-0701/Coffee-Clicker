//
//  AppData.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 09.09.25.
//

import SwiftUI
import UserNotifications
import ActivityKit

class AppData: ObservableObject {
    
    // MARK: DO NOT SAVE! ==============================================================
    
    // ALERTS
    @Published var firstAlert = false
    @Published var specialAlert = false
    @Published var isTooExpensive = false
    @Published var isAscendInfo = false
    @Published var isPearlInfo = false
    @Published var isStatsInfo = false
    @Published var ascendAlertTitle = ""
    @Published var ascendAlertText = ""
    
    // TIMER
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let cpsTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Published var timerRunning = true
    @Published var countDownTimer = 1
    
    // ITEMS
    @Published var coffeeItems = [
        AchievementItem(title: "Your first coffee!", reward: 1, description: "One sip closer to destiny. ☕️"),
        AchievementItem(title: "Neigborhood Buzz", reward: 1, description: "Everyone on your block is wide awake. 🤪"),
        AchievementItem(title: "City-Wide Caffeine Crisis", reward: 1, description: "Every citizen of your city is now vibrating at light speed. 🫨"),
        AchievementItem(title: "United States of Espresso", reward: 1, description: "You've brewed enough for every American. 🇺🇸☕️"),
        AchievementItem(title: "Caffeinated Humanity", reward: 2, description: "Everyone on Earth is officially awake. 🌍"),
        AchievementItem(title: "Milky Way Mocha", reward: 2, description: "Your coffee reaches every star in the galaxy. 🌌"),
        AchievementItem(title: "Intergalactic Barista", reward: 2, description: "You've opened coffee-shops across the entire universe. 🪐"),
        AchievementItem(title: "Caffeine Continuum", reward: 2, description: "Time itself vibrates to your brewing frequency. ⏳"),
        AchievementItem(title: "Quantum Brewer", reward: 3, description: "Your coffee exists in all possible mugs simultaneously. ⚛️"),
        AchievementItem(title: "Eternal Espresso", reward: 3, description: "Your coffee transcends the universe itself. ☄️"),
        AchievementItem(title: "Ultimate Bean Ascendant", reward: 5, description: "You are caffeine. You exist beyond numbers, beyond reality, beyond reality, beyond decaf. ☕️💫")
    ]
    @Published var itemItems = [
        AchievementItem(title: "It still Works (Kinda)", reward: 1, description: "A few sparks nerver hurt anyone... right?"),
        AchievementItem(title: "Collector of Junk", reward: 2, description: "You've gathered an army of almost-functional brewers."),
        AchievementItem(title: "Classic Taste", reward: 1, description: "You appreciate the old-school way - pressure, patience, and pride. 😌"),
        AchievementItem(title: "Finally Functional", reward: 1, description: "You've moved past the broken stuff. It actually brews! 🎉"),
        AchievementItem(title: "Corporate Coffee Corner", reward: 1, description: "Your machines hum in perfect caffeinated harmony. 🎶"),
        AchievementItem(title: "Sweet Victory", reward: 2, description: "Enough sugar to put a dentist's kid through college. 🍬"),
        AchievementItem(title: "Got Milk?", reward: 2, description: "Your inventory resembles a small dairy farm. 🥛"),
        AchievementItem(title: "Bean Collector", reward: 1, description: "You've stockpiled enough beans to survive a caffeine apocalypse. ☕️"),
        AchievementItem(title: "Mountain of Beans", reward: 2, description: "The sheer smell attracts coffee lovers from miles away. 🗺️"),
        AchievementItem(title: "Grandma's Secret Recipe", reward: 1, description: "Her brew brings comfort and unholy strength. ❤️"),
        AchievementItem(title: "Army of Nanas", reward: 3, description: "Their love is endless. So is the caffeine. 👵🏼"),
        AchievementItem(title: "Caffeine and Luxury", reward: 1, description: "When your brew shines brighter than your future. ✨"),
        AchievementItem(title: "24-Karat Brew", reward: 1, description: "Coffee so fancy it pays taxes in gold. 💰"),
        AchievementItem(title: "Entrepreneurial Spirit", reward: 1, description: "You've gone from drinker to dealer. 💼"),
        AchievementItem(title: "Chain Reaction", reward: 3, description: "You've started a coffee empire. Starbucks who? 🧋"),
        AchievementItem(title: "Teamwork Makes the Brew Work", reward: 3, description: "You can't spell 'coffee' without 'effort' (and lots of tired workers). 🫩"),
        AchievementItem(title: "Latte Artist", reward: 1, description: "Your foam art brings tears to grown men. 🎨"),
        AchievementItem(title: "Barista Brigade", reward: 2, description: "No order is too complex. Triple soy caramel drizzle? Done. 💪"),
        AchievementItem(title: "Master of Flavors", reward: 1, description: "You've elevated coffee into culinary art. 👨‍🍳"),
        AchievementItem(title: "Caffeine Cuisine", reward: 2, description: "You run a Michelin-rated espresso empire. 🌟"),
        AchievementItem(title: "The Big Brew", reward: 1, description: "Production has reached caffeinated mass levels. 🚀"),
        AchievementItem(title: "Bean Industrialist", reward: 3, description: "Your empire hums with the sound of a million grinders. ⚙️"),
        AchievementItem(title: "Industrial Strength", reward: 5, description: "These folks run the bean machines day and night. 🏭👨‍🏭")
    ]
    @Published var halloweenItems = [
        SpecialAchievementItem(reward: 1, title: "It's Halloween!", requirement: "Log in on the 31th of October", description: "It's time to scare your friends with your caffeine addiction! 🎃")
    ]
    @Published var christmasItems = [
        SpecialAchievementItem(reward: 1, title: "It's Christmas Eve!", requirement: "Log in on the 24th of December", description: "Spend some time with your family by drinking some coffee! ☕️🎄"),
        SpecialAchievementItem(reward: 1, title: "It's officially Christmas!", requirement: "Log in on the 25th of December", description: "Had too much coffee yesterday? Well, Christmas isn't over yet! 🫩☃️"),
        SpecialAchievementItem(reward: 1, title: "The last day of Christmas!", requirement: "Log in on the 26th of December", description: "One more day to celebrate by ... you guessed it! Drinking coffee! ☕️🫨")
    ]
    
    // TRACKING
    let currentMonth = Calendar.current.component(.month, from: Date())
    @Published var coffeeSteps: Double = 1
    @Published var isAscendBarDone = false
    
    // HELPERS
    @Published var isTextVisible = false
    @Published var showWhole = false
    @Published var fastCPS = false
    @Published var delay = 0
    @Published var brewingActivity: Activity<BrewingAttributes>?
    
    // SPECIAL EVENT
    @Published var specialRunning = false
    @Published var cpsMultiplier: Double = 1
    @Published var cpcMultiplier: Double = 1
    
    // TIME SPECIALS
    @Published var timeSpecial = 0
    @Published var halloween = false
    @Published var christmas = false
    
    // SHEETS
    @Published var newHere = false
    @Published var pinSheet = false
    
    // MARK: DO SAVE! ==============================================================
    
    // PLAYER STATS
    @Published var coffeeTotal: Double = 0
    @Published var offlineCoffee: Double = 0
    @Published var coffeeSpend: Double = 0
    @Published var itemsTotal: Double = 0
    @Published var timesClicked: Int = 0
    @Published var timesAscended = 0
    
    // PLAYER VARIABLES
    @Published var score: Double = 0
    @Published var cps: Double = 0
    @Published var money = 0.0
    @Published var coffeePerClick = 1
    @Published var offlineEarnings = 0.00
    
    // ASCENDING
    @Published var reachCoffeeTotal: Double = 50_000_000_000_000
    @Published var reachCoffeeSpend: Double = 25_000_000_000_000
    @Published var reachItemsTotal: Double = 500
    
    @Published var ascendTotal: Double = 75_000_000_000_500
    @Published var ascendProgress = 0.00
    @Published var ascend = false
    @Published var ascendMultiplier = 1
    @Published var priceAscend: Double = 10_000_000_000_000_000
    
    // STORE
    @Published var prices: [Double] = [25, 150, 1100, 13000, 140000, 1500000, 20000000, 340000000, 5000000000, 75000000000, 1000000000000, 15000000000000, 150000000000000, 2100000000000000, 25000000000000000]
    @Published var amounts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @Published var cpsPerItem: [Double] = [0.1, 1.5, 8, 50, 265, 1500, 7750, 45000, 250000, 1500000, 10000000, 75000000, 400000000, 2900000000, 20000000000]
    
    // SELLING
    @Published var pricePerCoffeeSell = 0.1
    @Published var amountCoffeeSell = 0
    @Published var sellPrices: [Double] = [2.50, 15, 110, 13e2, 14e3, 15e4, 2e6, 34e6, 5e8, 75e8, 1e11, 15e11, 15e12, 21e13, 25e14]
    @Published var amountsToSell = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // UPGRADING
    @Published var cursorPrice: Double = 1000
    @Published var cursorAmount = 0
    @Published var cursorUpgradePower = 4
    
    @Published var upgradePrices: [Double] = [25e2, 15e3, 11e4, 13e5, 14e6, 15e7, 2e9, 34e9, 5e11, 75e11, 1e14, 15e14, 15e15, 21e16, 25e17]
    @Published var amountUpgrade = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @Published var upgradePower = 2
    
    // SKINS
    @Published var skinNum = 0
    @Published var skinPage = 0
    
    @Published var cookies = 0
    @Published var ghosts = 0
    @Published var snowflakes = 0
    
    @Published var equipSkin0 = true
    @Published var equipSkin1 = false
    @Published var equipSkin2 = false
    @Published var equipSkin3 = false
    @Published var equipSkin4 = false
    @Published var equipSkin5 = false
    @Published var equipSkin6 = false
    @Published var equipSkin7 = false
    @Published var equipSkin8 = false
    @Published var equipSkin9 = false
    
    @Published var halloweenSkins = [false, false, false, false]
    @Published var christmasSkins = [false, false, false, false, false, false]
    
    // PEARL-SHOP
    @Published var pearls = 0
    @Published var pearlPrice1 = 2
    @Published var pearlPrice2 = 4
    @Published var pearlPrice3 = 7
    
    // BREWING
    @Published var brewing = false
    @Published var brewTime = 60
    @Published var brewingTimer = 0
    @Published var caseNum = 0
    
    // TIME TRAVEL
    @Published var clocks = 0
    @Published var clockPrice: Double = 1e3
    @Published var clockPower = 1800
    @Published var timeTravelPrices = [1, 4, 8, 15, 40, 75]
    @Published var timeTravelMultiplier = [1, 5, 10, 20, 50, 100]
    
    // TIME SPECIALS
    @Published var specialUnlocked = false
    @Published var halloweenUnlocked = false
    @Published var christmasUnlocked = false
    
    @Published var specialPage = 0
    @Published var specialStorePage = 0
    
    @Published var pumpkins: Double = 0
    @Published var pps: Double = 0
    @Published var halloweenStoreAmounts = [0, 0, 0]
    @Published var ghostAmount = 0
    
    // ACHIEVEMENTS
    @Published var achievementPage = 0
    
    @Published var coffeeAchievements: [Double] = [1, 1e3, 12e5, 34e7, 82e8, 15e10, 1e14, 1e18, 1e20, 1e30, 1e90]
    @Published var completedCoffeeAchievements = [false, false, false, false, false, false, false, false, false, false, false]
    @Published var coffeeRewards = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 5]
    
    @Published var itemAchievements: [Int] = [1, 100, 50, 10, 75, 100, 50, 25, 40, 10, 50, 10, 10, 10, 45, 40, 10, 35, 10, 30, 10, 40, 100]
    @Published var completedItemAchievements = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @Published var itemRewards = [1, 2, 1, 1, 1, 2, 2, 1, 2, 1, 3, 1, 1, 1, 3, 3, 1, 2, 1, 2, 1, 3, 5]
    @Published var itemListAchievement = [
        "broken Coffee Machine", "broken Coffee Machines", "Mokas", "new Coffee Machines", "new Coffee Machines", "Sugar", "Milk", "Coffee Beans", "Coffee Beans", "Grandmothers", "Grandmothers", "golden Coffee Machines", "golden Mokas", "Coffee Shops", "Coffee Shops", "Employees", "Baristas", "Baristas", "Coffee Chefs", "Coffee Chefs", "Coffee Factorys", "Coffee Factorys", "Factory Workers"
    ]
    
    @Published var completedHalloweenAchievements = [false, false, false]
    @Published var completedChristmasAchievements = [false, false, false, false, false]
    
    // SPECIAL EVENT
    @Published var specialProgress: Double = 0
    @Published var reachSpecialProgress: Double = 500
    
    // VIEWS
    @Published var tabViews: [(view: AnyView, name: String, image: String)] = [
        (AnyView(StoreView()), "Store", "storefront.fill"),
        (AnyView(SellingView()), "Selling", "dollarsign.square.fill"),
        (AnyView(UpgradeView()), "Upgrades", "arrow.up.square.fill"),
        (AnyView(SkinView()), "Skins", "cup.and.heat.waves.fill"),
        (AnyView(CoffeeShopView()), "Coffee-Shop", "creditcard.fill"),
        (AnyView(PearlView()), "Pearl-Shop", "diamond.fill"),
        (AnyView(TimeTravelView()), "Time Travel", "clock.fill"),
        (AnyView(SpecialView()), "Specials", "fireworks"),
        (AnyView(AchievementView()), "Achievements", "star.fill"),
        (AnyView(SettingsView()), "Settings", "gear.badge")
    ]
    @Published var conditionViews: [Bool] = []
    @Published var pinnedViews: [(view: AnyView, name: String, image: String)] = []
    @Published var pinnedConditions: [Bool] = []
    
    // MARK: Default values registered with UserDefaults + init()
    
    static let registeredDefaults: [String: Any] = [
    "coffeeTotal": 0.0,
    "coffeeSpend": 0.0,
    "itemsTotal": 0.0,
    "timesAscended": 0,
    "offlineCoffee": 0.0,
    "timesClicked": 0,

    "reachCoffeeTotal": 50_000_000_000_000.0,
    "reachCoffeeSpend": 25_000_000_000_000.0,
    "reachItemsTotal": 500.0,
    "ascendTotal": 75_000_000_000_500.0,
    "ascendMultiplier": 1,
    "priceAscend": 10_000_000_000_000_000.0,

    "score": 0.0,
    "cps": 0.0,
    "money": 0.0,
    "ascend": false,
    "ascendProgress": 0.0,
    "coffeePerClick": 1,
    "pricePerCoffeeSell": 0.1,
    "cursorPrice": 1000.0,
    "cursorAmount": 0,
    "upgradePower": 2,
    "cursorUpgradePower": 4,
    "offlineEarnings": 0.0,
    "pearlPrice1": 2,
    "pearlPrice2": 4,
    "pearlPrice3": 7,
    "skinNum": 0,
    "specialProgress": 0.0,
    "reachSpecialProgress": 100.0,
    "clocks": 0,
    "clockPrice": 1e3,
    "cookies": 0,

    // skins
    "equipSkin0": true,
    "equipSkin1": false,
    "equipSkin2": false,
    "equipSkin3": false,
    "equipSkin4": false,
    "equipSkin5": false,
    "equipSkin6": false,
    "equipSkin7": false,
    "equipSkin8": false,
    "equipSkin9": false,
    
    "completedHalloweenAchievements": [false, false, false],
    "completedChristmasAchievements": [false, false, false, false, false],
    
    // Time Specials (Halloween, Christmas, ...)
    "ghosts": 0,
    "snowflakes": 0,
    
    "halloweenUnlocked": false,
    "christmasUnlocked": false,
    
    "halloweenSkins": [false, false, false, false],
    "christmasSkins": [false, false, false, false, false, false],
    
    // Halloween Special
    "pumpkins": 0,
    "pps": 0,
    
    "ghostAmount": 0,
    "halloweenStoreAmounts": [0, 0, 0],
    
    "specialUnlocked": false,
    
    // arrays
    "prices": [25.0, 150.0, 1100.0, 13000.0, 140000.0, 1500000.0, 20000000.0, 340000000.0, 5000000000.0, 75000000000.0, 1000000000000.0, 15000000000000.0, 150000000000000.0, 2100000000000000.0, 25000000000000000.0],
    "cpsPerItem": [0.1, 1.5, 8.0, 50.0, 265.0, 1500.0, 7750.0, 45000.0, 250000.0, 1500000.0, 10000000.0, 75000000.0, 400000000.0, 2900000000.0, 20000000000.0],
    "amounts": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    "sellPrices": [2.50, 15.0, 110.0, 13e2, 14e3, 15e4, 2e6, 34e6, 5e8, 75e8, 1e11, 15e11, 15e12, 21e13, 25e14],
    "upgradePrices": [25e2, 15e3, 11e4, 13e5, 14e6, 15e7, 2e9, 34e9, 5e11, 75e11, 1e14, 15e14, 15e15, 21e16, 25e17],
    "amountUpgrade": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    "completedCoffeeAchievements": [false, false, false, false, false, false, false, false, false, false, false],
    "completedItemAchievements": [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    ]
    
    init() {
        pinnedViews = [tabViews[0], tabViews[1], tabViews[2]]
        UserDefaults.standard.register(defaults: Self.registeredDefaults)
        loadData()
        conditionViews = [coffeeTotal >= 25, itemsTotal >= 50, timesClicked >= 100, cookies >= 5 || equipSkin1 == true, coffeeSpend >= 1000, timesAscended >= 1, offlineCoffee >= 1e9, coffeeTotal >= 1, true]
        pinnedConditions = [conditionViews[0], conditionViews[1], conditionViews[2]]
    }
    
    // MARK: FUNCTIONS ==============================================================
    
    // TIMERS
    
    func timerFunc() {
        if countDownTimer > 0 && timerRunning {
            countDownTimer -= 1
            if score < 1000 {
                fastCPS = true
            }
            if !fastCPS {
                score += cps * cpsMultiplier
                coffeeTotal += cps * cpsMultiplier
            }
            pearls = timesAscended
            conditionViews = [coffeeTotal >= 25, itemsTotal >= 50, timesClicked >= 100, cookies >= 5 || equipSkin1 == true, coffeeSpend >= 1000, timesAscended >= 1, offlineCoffee >= 1e9, coffeeTotal >= 1, true]
            
            if brewing {
                brewingTimer += 1
                if let activity = brewingActivity {
                    updateBrewingActivity(activity: activity, elapsedTime: brewingTimer)
                }
                if brewTime == brewingTimer {
                    pearlUpgrade()
                    brewing = false
                    if let activity = brewingActivity {
                        endBrewingActivity(activity: activity)
                    }
                }
            }
            
            for i in 0..<itemAchievements.count {
                if !completedItemAchievements[i] {
                    let itemAmounts = [amounts[0], amounts[0], amounts[1], amounts[2], amounts[2], amounts[3], amounts[4], amounts[5], amounts[5], amounts[6], amounts[6], amounts[7], amounts[8], amounts[9], amounts[9], amounts[10], amounts[11], amounts[11], amounts[12], amounts[12], amounts[13], amounts[13], amounts[14]]
                    if itemAmounts[i] >= itemAchievements[i] {
                        completedItemAchievements[i] = true
                        cookies += itemRewards[i]
                        basicNotification(body: itemItems[i].title)
                    }
                }
            }
            
            for i in 0..<coffeeAchievements.count {
                if !completedCoffeeAchievements[i] {
                    if score >= coffeeAchievements[i] {
                        completedCoffeeAchievements[i] = true
                        cookies += coffeeRewards[i]
                        basicNotification(body: coffeeItems[i].title)
                    }
                }
            }
            
            // SPECIAL ACHIEVEMENTS
            
            if !specialUnlocked {
                if halloweenUnlocked || christmasUnlocked {
                    if delay == 0 {
                        basicNotification(body: "You've unlocked Special Events!")
                    }
                    if delay == 2 {
                        basicNotification(body: "New Pages have been added to Skins and Achievements.")
                        specialUnlocked = true
                    }
                    delay += 1
                }
            }
            
            // Halloween
            
            if isToday(day: 31, month: 10) && !completedHalloweenAchievements[0] {
                completedHalloweenAchievements[0] = true
                ghosts += halloweenItems[0].reward
                basicNotification(body: halloweenItems[0].title)
            }
            
            // Christmas
            
            if isToday(day: 24, month: 12) && !completedChristmasAchievements[0] {
                completedChristmasAchievements[0] = true
                snowflakes += christmasItems[0].reward
                basicNotification(body: christmasItems[0].title)
            }
            
            if isToday(day: 25, month: 12) && !completedChristmasAchievements[1] {
                completedChristmasAchievements[1] = true
                snowflakes += christmasItems[1].reward
                basicNotification(body: christmasItems[1].title)
            }
            
            if isToday(day: 26, month: 12) && !completedChristmasAchievements[2] {
                completedChristmasAchievements[2] = true
                snowflakes += christmasItems[2].reward
                basicNotification(body: christmasItems[2].title)
            }
            
            if halloween || christmas {
                pumpkins += pps
            } else {
                pumpkins = 0
            }
            
            reachSpecialProgress = 500
            
            // Coffee Stepper adjustments
            if score > 1_000_000_000_000_000_000_000 {
                coffeeSteps = 1_000_000_000_000_000_000_000
            } else if score > 1_000_000_000_000_000_000 {
                coffeeSteps = 1_000_000_000_000_000_000
            } else if score > 1_000_000_000_000_000 {
                coffeeSteps = 1_000_000_000_000_000
            } else if score > 1_000_000_000_000 {
                coffeeSteps = 1_000_000_000_000
            } else if score > 1_000_000_000 {
                coffeeSteps = 1_000_000_000
            } else if score > 1_000_000 {
                coffeeSteps = 1_000_000
            } else if score > 1_000 {
                coffeeSteps = 1_000
            } else {
                coffeeSteps = 10
            }
            
            if !specialAlert {
                specialProgress += 1
            }
            
            if specialProgress >= reachSpecialProgress {
                specialProgress = 0
                specialAlert = true
            }
            
            if timeSpecial != 0 {
                timeSpecial -= 1
            } else if timeSpecial == 0 && specialRunning == true {
                undoSpecialEvent()
            }
            
            if currentMonth == 10 {
                halloween = true
            } else {
                halloween = false
            }
            
            if currentMonth == 12 {
                christmas = true
            } else {
                christmas = false
            }
            
            saveData()
        }
        else {
            countDownTimer = 1
        }
    }
    
    func cpsTimerFunc() {
        if fastCPS {
            score += (cps * cpsMultiplier)/10
            coffeeTotal += (cps * cpsMultiplier)/10
        }
    }
    
    // SPECIAL EVENT
    
    func SpecialEvent() {
        isTextVisible = true
        specialRunning = true
        timeSpecial = 30
        cpsMultiplier = 10
        cpcMultiplier = 15
        specialProgress = 0
    }
    
    func undoSpecialEvent() {
        isTextVisible = false
        specialRunning = false
        cpsMultiplier = 1
        cpcMultiplier = 1
    }
    
    // BUY, SELL, UPGRADE FUNCTIONS
    
    func buyItem(at index: Int) {
        if score >= prices[index] {
            score -= prices[index]
            coffeeSpend += prices[index]
            amounts[index] += 1
            itemsTotal += 1
            cps += Double(cpsPerItem[index])
            prices[index] *= 1.15
        }
        else {
            isTooExpensive = true
        }
    }
    
    func sellItem(at index: Int) {
        money += sellPrices[index] * Double(amountsToSell[index])
        cps -= Double(amountsToSell[index]) * cpsPerItem[index]
        amounts[index] -= amountsToSell[index]
        prices[index] /= pow(1.15, Double(amountsToSell[index]))
        amountsToSell[index] = 0
    }
    
    func upgradeCursor() {
        if score >= Double(cursorPrice) {
            score -= Double(cursorPrice)
            cursorAmount += 1
            coffeePerClick *= cursorUpgradePower
            cursorPrice *= 5
        }
        else {
            isTooExpensive = true
        }
    }
    
    func upgradeItem(at index: Int) {
        if score >= Double(upgradePrices[index]) {
            score -= Double(upgradePrices[index])
            amountUpgrade[index] += 1
            cps -= Double(amounts[index]) * cpsPerItem[index]
            cpsPerItem[index] *= Double(upgradePower)
            cps += Double(amounts[index]) * cpsPerItem[index]
            upgradePrices[index] *= 5
        }
        else {
            isTooExpensive = true
        }
    }
    
    // ASCENDING AND RESETTING
    
    func upgrade() {
        ascendProgress = 0
        // Adds Total Coffee Count to Upgrade Progress
        if coffeeTotal <= reachCoffeeTotal {
            ascendProgress += Double(coffeeTotal)
        }
        else if coffeeTotal > reachCoffeeTotal {
            ascendProgress += Double(reachCoffeeTotal)
        }
        // Adds Total Coffee spent to Upgrade Progress
        if coffeeSpend <= reachCoffeeSpend {
            ascendProgress += Double(coffeeSpend)
        }
        else if coffeeSpend > reachCoffeeSpend {
            ascendProgress += Double(reachCoffeeSpend)
        }
        // Adds Total items bought to Upgrade Progress
        if itemsTotal <= reachItemsTotal {
            ascendProgress += Double(itemsTotal)
        }
        else if itemsTotal > reachItemsTotal {
            ascendProgress += Double(reachItemsTotal)
        }
        if ascendProgress == Double(ascendTotal) {
            ascend = true
        }
        else {
            ascend = false
        }
    }
    
    func resetAscend() {
        ascendMultiplier *= 2
        
        // Coffee Selling
        amountCoffeeSell = 0
        pricePerCoffeeSell = 0.1
        
        // Item Selling
        amountsToSell = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        sellPrices = [2.50, 15, 110, 13e2, 14e3, 15e4, 2e6, 34e6, 5e8, 75e8, 1e11, 15e11, 15e12, 21e13, 25e14]
        
        // Player Stats
        timesAscended += 1
        
        reachCoffeeTotal *= 2
        reachCoffeeSpend *= 2
        reachItemsTotal *= 2
        ascendTotal *= 2
        priceAscend *= 2
        
        // Player vars
        score = 0
        cps = 0
        money = 0
        ascend = false
        ascendProgress = 0.00
        coffeePerClick = 1
        offlineEarnings = 0.00
        clocks = 0
        clockPrice = 1e3
        
        //Store items
        prices = [25, 150, 1100, 13000, 140000, 1500000, 20000000, 340000000, 5000000000, 75000000000, 1000000000000, 15000000000000, 150000000000000, 2100000000000000, 25000000000000000]
        cpsPerItem = [0.1, 1.5, 8, 50, 265, 1500, 7750, 45000, 250000, 1500000, 10000000, 75000000, 400000000, 2900000000, 20000000000]
        amounts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // Upgrading Cursor
        cursorPrice = 1000
        cursorAmount = 0
        
        // Upgrading Items
        upgradePrices = [25e2, 15e3, 11e4, 13e5, 14e6, 15e7, 2e9, 34e9, 5e11, 75e11, 1e14, 15e14, 15e15, 21e16, 25e17]
        amountUpgrade = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        upgradePower *= 2
        cursorUpgradePower *= 2
        
        // *= ascendMultiplier
        coffeePerClick *= ascendMultiplier
        for i in 0..<cpsPerItem.count {
            cpsPerItem[i] *= Double(ascendMultiplier)
        }
    }
    
    func pearlUpgrade() {
        if caseNum == 0 {
            print("brewed")
        }
        if caseNum == 1 {
            for i in 0..<prices.count {
                prices[i] /= 2
            }
            pearls -= pearlPrice1
            pearlPrice1 += 1
        }
        if caseNum == 2 {
            cursorPrice /= 2
            for i in 0..<upgradePrices.count {
                upgradePrices[i] /= 2
            }
            pearls -= pearlPrice2
            pearlPrice2 += 1
        }
        if caseNum == 3 {
            pricePerCoffeeSell *= 2
            for i in 0..<sellPrices.count {
                sellPrices[i] *= 2
            }
            pearls -= pearlPrice3
            pearlPrice3 += 1
        }
    }
    
    func reset() {
        // Player Stats
        coffeeTotal = 0
        coffeeSpend = 0
        itemsTotal = 0
        timesAscended = 0
        offlineCoffee = 0
        timesClicked = 0
        
        reachCoffeeTotal = 50_000_000_000_000
        reachCoffeeSpend = 25_000_000_000_000
        reachItemsTotal = 5_000
        ascendTotal = 75_000_000_005_000
        ascendMultiplier = 1
        priceAscend = 10_000_000_000_000_000
        
        // Player vars
        score = 0
        cps = 0
        money = 0.0
        ascend = false
        ascendProgress = 0.00
        coffeePerClick = 1
        offlineEarnings = 0.00
        pearls = 0
        clocks = 0
        clockPrice = 1e3
        
        // Skins
        skinNum = 0
        
        equipSkin1 = false
        equipSkin2 = false
        equipSkin3 = false
        equipSkin4 = false
        equipSkin5 = false
        equipSkin6 = false
        equipSkin7 = false
        equipSkin8 = false
        equipSkin9 = false
        
        // Store items
        prices = [25, 150, 1100, 13000, 140000, 1500000, 20000000, 340000000, 5000000000, 75000000000, 1000000000000, 15000000000000, 150000000000000, 2100000000000000, 25000000000000000]
        cpsPerItem = [0.1, 1.5, 8, 50, 265, 1500, 7750, 45000, 250000, 1500000, 10000000, 75000000, 400000000, 2900000000, 20000000000]
        amounts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // Coffee Selling
        amountCoffeeSell = 0
        pricePerCoffeeSell = 0.1
        
        // Item Selling
        amountsToSell = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        sellPrices = [2.50, 15, 110, 13e2, 14e3, 15e4, 2e6, 34e6, 5e8, 75e8, 1e11, 15e11, 15e12, 21e13, 25e14]
        
        // Upgrading Cursor
        cursorPrice = 1000
        cursorAmount = 0
        
        // Upgrading Items
        upgradePrices = [25e2, 15e3, 11e4, 13e5, 14e6, 15e7, 2e9, 34e9, 5e11, 75e11, 1e14, 15e14, 15e15, 21e16, 25e17]
        amountUpgrade = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        upgradePower = 2
        cursorUpgradePower = 4
        
        // Sale price
        pearlPrice1 = 2
        pearlPrice2 = 4
        pearlPrice3 = 7
        
        // Special Event
        specialProgress = 0
        reachSpecialProgress = 100
        
        // Achievements
        cookies = 0
        completedCoffeeAchievements = [false, false, false, false, false, false, false, false, false, false, false]
        completedItemAchievements = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
        completedHalloweenAchievements = [false, false, false]
        completedChristmasAchievements = [false, false, false, false, false]
        
        // Time Specials (Halloween, Christmas, ...)
        ghosts = 0
        snowflakes = 0
        
        halloweenUnlocked = false
        christmasUnlocked = false
        halloweenSkins = [false, false, false, false]
        christmasSkins = [false, false, false, false, false, false]
        
        // Halloween Special
        pumpkins = 0
        pps = 0
        
        ghostAmount = 0
        halloweenStoreAmounts = [0, 0, 0]
        
        specialUnlocked = false
        
        saveData()
    }
    
    // MANAGING DATA
    
    func saveData() {
        let d = UserDefaults.standard
        
        // Single values
        d.set(coffeeTotal, forKey: "coffeeTotal")
        d.set(coffeeSpend, forKey: "coffeeSpend")
        d.set(itemsTotal, forKey: "itemsTotal")
        d.set(timesAscended, forKey: "timesAscended")
        d.set(reachCoffeeTotal, forKey: "reachCoffeeTotal")
        d.set(reachCoffeeSpend, forKey: "reachCoffeeSpend")
        d.set(reachItemsTotal, forKey: "reachItemsTotal")
        d.set(ascendTotal, forKey: "ascendTotal")
        d.set(priceAscend, forKey: "priceAscend")
        d.set(score, forKey: "score")
        d.set(cps, forKey: "cps")
        d.set(money, forKey: "money")
        d.set(ascend, forKey: "ascend")
        d.set(ascendProgress, forKey: "ascendProgress")
        d.set(coffeePerClick, forKey: "coffeePerClick")
        d.set(pricePerCoffeeSell, forKey: "pricePerCoffeeSell")
        d.set(cursorPrice, forKey: "cursorPrice")
        d.set(cursorAmount, forKey: "cursorAmount")
        d.set(upgradePower, forKey: "upgradePower")
        d.set(cursorUpgradePower, forKey: "cursorUpgradePower")
        d.set(offlineCoffee, forKey: "offlineCoffee")
        d.set(offlineEarnings, forKey: "offlineEarnings")
        d.set(pearlPrice1, forKey: "pearlPrice1")
        d.set(pearlPrice2, forKey: "pearlPrice2")
        d.set(pearlPrice3, forKey: "pearlPrice3")
        d.set(skinNum, forKey: "skinNum")
        d.set(equipSkin1, forKey: "equipSkin1")
        d.set(equipSkin2, forKey: "equipSkin2")
        d.set(equipSkin3, forKey: "equipSkin3")
        d.set(equipSkin4, forKey: "equipSkin4")
        d.set(equipSkin5, forKey: "equipSkin5")
        d.set(equipSkin6, forKey: "equipSkin6")
        d.set(equipSkin7, forKey: "equipSkin7")
        d.set(equipSkin8, forKey: "equipSkin8")
        d.set(equipSkin9, forKey: "equipSkin9")
        d.set(specialProgress, forKey: "specialProgress")
        d.set(reachSpecialProgress, forKey: "reachSpecialProgress")
        d.set(clocks, forKey: "clocks")
        d.set(clockPrice, forKey: "clockPrice")
        d.set(ascendMultiplier, forKey: "ascendMultiplier")
        d.set(timesClicked, forKey: "timesClicked")
        d.set(cookies, forKey: "cookies")
        d.set(ghosts, forKey: "ghosts")
        d.set(snowflakes, forKey: "snowflakes")
        d.set(halloweenUnlocked, forKey: "halloweenUnlocked")
        d.set(christmasUnlocked, forKey: "christmasUnlocked")
        d.set(pumpkins, forKey: "pumpkins")
        d.set(pps, forKey: "pps")
        d.set(ghostAmount, forKey: "ghostAmount")
        d.set(specialUnlocked, forKey: "specialUnlocked")
        
        // Arrays
        d.set(prices, forKey: "prices")
        d.set(cpsPerItem, forKey: "cpsPerItem")
        d.set(amounts, forKey: "amounts")
        d.set(sellPrices, forKey: "sellPrices")
        d.set(upgradePrices, forKey: "upgradePrices")
        d.set(amountUpgrade, forKey: "amountUpgrade")
        d.set(completedCoffeeAchievements, forKey: "completedCoffeeAchievements")
        d.set(completedItemAchievements, forKey: "completedItemAchievements")
        d.set(completedHalloweenAchievements, forKey: "completedHalloweenAchievements")
        d.set(completedChristmasAchievements, forKey: "completedChristmasAchievements")
        d.set(halloweenSkins, forKey: "halloweenSkins")
        d.set(christmasSkins, forKey: "christmasSkins")
        d.set(halloweenStoreAmounts, forKey: "halloweenStoreAmounts")
        
        // Save the last active time
        let currentTime = Date()
        d.set(currentTime, forKey: "lastActiveTime")
    }
    
    func loadData() {
        let d = UserDefaults.standard
        
        // Single values
        coffeeTotal = d.double(forKey: "coffeeTotal")
        coffeeSpend = d.double(forKey: "coffeeSpend")
        itemsTotal = d.double(forKey: "itemsTotal")
        timesAscended = d.integer(forKey: "timesAscended")
        reachCoffeeTotal = d.double(forKey: "reachCoffeeTotal")
        reachCoffeeSpend = d.double(forKey: "reachCoffeeSpend")
        reachItemsTotal = d.double(forKey: "reachItemsTotal")
        ascendTotal = d.double(forKey: "ascendTotal")
        priceAscend = d.double(forKey: "priceAscend")
        score = d.double(forKey: "score")
        cps = d.double(forKey: "cps")
        money = d.double(forKey: "money")
        ascend = d.bool(forKey: "ascend")
        ascendProgress = d.double(forKey: "ascendProgress")
        coffeePerClick = d.integer(forKey: "coffeePerClick")
        pricePerCoffeeSell = d.double(forKey: "pricePerCoffeeSell")
        cursorPrice = d.double(forKey: "cursorPrice")
        cursorAmount = d.integer(forKey: "cursorAmount")
        upgradePower = d.integer(forKey: "upgradePower")
        cursorUpgradePower = d.integer(forKey: "cursorUpgradePower")
        offlineCoffee = d.double(forKey: "offlineCoffee")
        offlineEarnings = d.double(forKey: "offlineEarnings")
        pearlPrice1 = d.integer(forKey: "pearlPrice1")
        pearlPrice2 = d.integer(forKey: "pearlPrice2")
        pearlPrice3 = d.integer(forKey: "pearlPrice3")
        skinNum = d.integer(forKey: "skinNum")
        specialProgress = d.double(forKey: "specialProgress")
        reachSpecialProgress = d.double(forKey: "reachSpecialProgress")
        clocks = d.integer(forKey: "clocks")
        clockPrice = d.double(forKey: "clockPrice")
        ascendMultiplier = d.integer(forKey: "ascendMultiplier")
        timesClicked = d.integer(forKey: "timesClicked")
        cookies = d.integer(forKey: "cookies")
        ghosts = d.integer(forKey: "ghosts")
        snowflakes = d.integer(forKey: "snowflakes")
        pumpkins = d.double(forKey: "pumpkins")
        pps = d.double(forKey: "pps")
        ghostAmount = d.integer(forKey: "ghostAmount")
        
        // Bools
        equipSkin1 = d.bool(forKey: "equipSkin1")
        equipSkin2 = d.bool(forKey: "equipSkin2")
        equipSkin3 = d.bool(forKey: "equipSkin3")
        equipSkin4 = d.bool(forKey: "equipSkin4")
        equipSkin5 = d.bool(forKey: "equipSkin5")
        equipSkin6 = d.bool(forKey: "equipSkin6")
        equipSkin7 = d.bool(forKey: "equipSkin7")
        equipSkin8 = d.bool(forKey: "equipSkin8")
        equipSkin9 = d.bool(forKey: "equipSkin9")
        halloweenUnlocked = d.bool(forKey: "halloweenUnlocked")
        christmasUnlocked = d.bool(forKey: "christmasUnlocked")
        specialUnlocked = d.bool(forKey: "specialUnlocked")
        
        // Arrays
        prices = d.array(forKey: "prices") as? [Double] ?? []
        cpsPerItem = d.array(forKey: "cpsPerItem") as? [Double] ?? []
        amounts = d.array(forKey: "amounts") as? [Int] ?? []
        sellPrices = d.array(forKey: "sellPrices") as? [Double] ?? []
        upgradePrices = d.array(forKey: "upgradePrices") as? [Double] ?? []
        amountUpgrade = d.array(forKey: "amountUpgrade") as? [Int] ?? []
        completedCoffeeAchievements = d.array(forKey: "completedCoffeeAchievements") as? [Bool] ?? []
        completedItemAchievements = d.array(forKey: "completedItemAchievements") as? [Bool] ?? []
        completedHalloweenAchievements = d.array(forKey: "completedHalloweenAchievements") as? [Bool] ?? []
        completedChristmasAchievements = d.array(forKey: "completedChristmasAchievements") as? [Bool] ?? []
        halloweenSkins = d.array(forKey: "halloweenSkins") as? [Bool] ?? []
        christmasSkins = d.array(forKey: "christmasSkins") as? [Bool] ?? []
        halloweenStoreAmounts = d.array(forKey: "halloweenStoreAmounts") as? [Int] ?? []
        
        // Load last active time + calculate earnings
        if let lastTime = d.object(forKey: "lastActiveTime") as? Date {
            let currentTime = Date()
            let timeElapsed = currentTime.timeIntervalSince(lastTime)
            offlineEarnings = timeElapsed * cps
            score += offlineEarnings
            coffeeTotal += offlineEarnings
            offlineCoffee += offlineEarnings
        }
        
        if score == 0 && cps == 0 {
            firstAlert = true
        }
    }
    
    // HELPER FUNCTIONS
    
    func isToday(day: Int, month: Int) -> Bool {
        let today = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.day, .month], from: today)
        return components.day == day && components.month == month
    }
    
    func formatNumber(_ num: Double) -> String {
        if num == 0 {return "0"}
        
        let sign = num < 0 ? "-" : ""
        var value = abs(num)
        var index = 0
        let baseSuffixes = ["", "K", "M", "B", "T"]
        
        while value >= 1000 {
            value /= 1000
            index += 1
        }
        
        if index < baseSuffixes.count {
            if index == 0 {
                return "\(sign)\(Int(value))"
            } else {
                let truncated = Double(Int(value * 10)) / 10.0
                return "\(sign)\(truncated)\(baseSuffixes[index])"
            }
        }
        
        var letterIndex = index - (baseSuffixes.count - 1)
        var letters = ""
        
        while letterIndex > 0 {
            let rem = (letterIndex - 1) % 26
            letters = String(UnicodeScalar(97 + rem)!) + letters
            letterIndex = (letterIndex - 1) / 26
        }
        
        while letters.count < 2 { letters = "a" + letters}
        
        let truncated = Double(Int(value * 10)) / 10.0
        return "\(sign)\(truncated)\(letters)"
    }
    
    func formatNumberD(_ num: Double) -> String {
        if num == 0 {return "0"}
        
        let sign = num < 0 ? "-" : ""
        var value = abs(num)
        var index = 0
        let baseSuffixes = ["", "K", "M", "B", "T"]
        
        while value >= 1000 {
            value /= 1000
            index += 1
        }
        
        if index < baseSuffixes.count {
            let truncated = Double(Int(value * 10)) / 10.0
            return "\(sign)\(truncated)\(baseSuffixes[index])"
        }
        
        var letterIndex = index - (baseSuffixes.count - 1)
        var letters = ""
        
        while letterIndex > 0 {
            let rem = (letterIndex - 1) % 26
            letters = String(UnicodeScalar(97 + rem)!) + letters
            letterIndex = (letterIndex - 1) / 26
        }
        
        while letters.count < 2 { letters = "a" + letters}
        
        let truncated = Double(Int(value * 10)) / 10.0
        return "\(sign)\(truncated)\(letters)"
    }
    
    func roundPrices() {
        prices = prices.map {price in price.rounded()}
    }
    
    // NOTIFICATIONS
    
    func basicNotification(body: String) {
        let content = UNMutableNotificationContent()
        content.title = "New Achievement! 🎉"
        content.body = "\(body)"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification sheduled!")
            }
        }
    }
    
    func offlineNotification(body: String, currentScore: Double, currentCPS: Double, target: Double) {
        guard currentScore < target else { return }
        
        let secondsUntilTarget = (target - currentScore) / currentCPS
        print("⌚️ Scheduling notification in \(secondsUntilTarget) seconds. (\(secondsUntilTarget/60) mins / \((secondsUntilTarget/60)/60) hrs.)")
        
        let content = UNMutableNotificationContent()
        content.title = "New Achievement! 🎉"
        content.body = "\(body)"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondsUntilTarget, repeats: false)
        let request = UNNotificationRequest(identifier: "milestone_\(target)", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification sheduled!")
            }
        }
    }
    
    // LIVE ACTIVITY

    func startBrewingActivity(name: String, totalTime: Int) {
        let initialState = BrewingAttributes.ContentState(
            elapsedTime: 0,
            totalTime: totalTime,
            isBrewing: true,
            name: name
        )
        
        let attributes = BrewingAttributes(id: UUID())
        
        do {
            let activity = try Activity<BrewingAttributes>.request(
                attributes: attributes,
                content: ActivityContent(state: initialState, staleDate: nil),
                pushType: nil
            )
            brewingActivity = activity   // ✅ store activity so updates can happen
            print("Started brewing activity: \(activity.id)")
        } catch {
            print("Error starting activity: \(error.localizedDescription)")
        }
    }

    func updateBrewingActivity(activity: Activity<BrewingAttributes>, elapsedTime: Int) {
        Task {
            let updatedState = BrewingAttributes.ContentState(
                elapsedTime: elapsedTime,
                totalTime: activity.content.state.totalTime, // just use existing totalTime
                isBrewing: true,
                name: activity.content.state.name
            )
            
            let updatedContent = ActivityContent(state: updatedState, staleDate: nil)
            await activity.update(updatedContent)
        }
    }

    func endBrewingActivity(activity: Activity<BrewingAttributes>) {
        Task {
            let finalState = BrewingAttributes.ContentState(
                elapsedTime: activity.content.state.totalTime,
                totalTime: activity.content.state.totalTime,
                isBrewing: false,
                name: activity.content.state.name
            )
            
            let finalContent = ActivityContent(state: finalState, staleDate: nil)
            await activity.end(finalContent, dismissalPolicy: .immediate)
            
            // ✅ Clear reference so you can start a new brewing session
            brewingActivity = nil
        }
    }
    
}
