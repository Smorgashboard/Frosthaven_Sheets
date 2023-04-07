//
//  CharacterCreationView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI
import CoreData

struct CharacterCreationView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var purchaseManager: PurchaseManager
    @EnvironmentObject var settings: Settings
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    @State private var characterName = ""
    @State private var playableClass: String = "boneshaper"
    @State private var startingLevel = 1
    @State private var selectedKey = "Dangerous Game"
    @State private var selectedPlayableClass: PlayableClass? = nil
    @State private var pcLabel: String = ""
    @State private var selectedPlayableClassID: String = ""
   
    private var fontColor: Color{.white}
    private var tileColor: Color{CustomColor.otherGray}
    private var borderColor: Color{CustomColor.blueish}
    private var titleColor: Color{CustomColor.blueish}
    
    var characteristics: [String] {
        return charDict[playableClass] ?? []
    }
    
    @State private var selectedImageIndex = 0
    
    var body: some View {
        NavigationStack {
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
            VStack{
                Form {
                    Section(header: Text("Character Information")) {
                        TextField("Character Name", text: $characterName)
                        Menu(content: {
                            Picker("Playable Class", selection: $playableClass) {
                                if settings.hideClassNames{
                                    if purchaseManager.hasUnlockedChars {
                                        ForEach(allClasses, id: \.id) { x in
                                            Image(x.imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: 25, maxHeight: 25)
                                                .tag(x.id)
                                        }
                                    } else {
                                        ForEach(startingClasses, id: \.id) { x in
                                            Image(x.imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: 25, maxHeight: 25, alignment: .center)
                                                .tag(x.id)
                                        }
                                    }
                                } else {
                                    if purchaseManager.hasUnlockedChars {
                                        ForEach(allClasses, id: \.id) { x in
                                            HStack{
                                                Text(x.label)
                                                Image(x.imageName)
                                            }
                                            .tag(x.id)
                                        }
                                    } else {
                                        ForEach(startingClasses, id: \.id) { x in
                                            HStack{
                                                Text(x.label)
                                                Image(x.imageName)
                                            }
                                            .tag(x.id)
                                        }
                                    }
                                }
                            }
                            
                            
                        }, label: {
                            HStack{
                                Text(getDisplayClass(playableClass: playableClass))
                                Spacer()
                                Image(getLogo(playableClass: playableClass))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 25, maxHeight: 25)
                            }
                        })
                        
                        
                        
                        HStack{
                            
                            ForEach(0 ..< characteristics.count, id: \.self) { x in
                                HStack{
                                    Text("\(characteristics[x])")
                                        .foregroundColor(titleColor)
                                        .padding([.vertical, .leading])
                                }
                            }
                            
                        }

                        Text("Hand Size: \(getHandSize(playableClass: playableClass))")
                        Text("Starting Health: \(getHealth(level: Int16(startingLevel), playableClass: playableClass))")
                            .foregroundColor(.red)
                        Text("Complexity: \(getComplexity(playableClass: playableClass))")
                    }
                    
                    Section(header: Text("Starting Level")) {
                        Stepper(value: $startingLevel, in: 1...9) {
                            Text("\(startingLevel)")
                        }
                    }
                    Picker("Reitrment Goal", selection: $selectedKey) {
                        ForEach(retirementGoals.keys.sorted(), id: \.self) { key in
                            Text(key)
                        }
                    }
                    Text("Flavor Text:").fontWeight(.bold)
                    Text("\(retirementGoals[selectedKey]!.0)")
                    Text("Goal:").fontWeight(.bold)
                    Text("\(retirementGoals[selectedKey]!.1)")
                    Text("Rewards:").fontWeight(.bold)
                    Text("\(retirementGoals[selectedKey]!.2)")
                    
                    
                    
                }
                .scrollContentBackground(Visibility.hidden)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .navigationBarTitle("Create Character", displayMode: .inline)
                .toolbarBackground(Color.black, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                
                Button(action: {
                    let newCharacter = Character(context: self.moc)
                    newCharacter.name = characterName
                    newCharacter.startingLevel = Int16(startingLevel)
                    newCharacter.level = Int16(startingLevel)
                    newCharacter.playableClass = playableClass
                    newCharacter.id = UUID()
                    newCharacter.logo = getLogo(playableClass: playableClass)
                    newCharacter.retirementGoal = selectedKey
                    newCharacter.displayClass = getDisplayClass(playableClass: playableClass)
                    newCharacter.xp = xpDict[startingLevel]!
                    newCharacter.inventoryItems = []
                    newCharacter.attackDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
                    newCharacter.unlockedCards = getUnlockedCards(playableClass: playableClass)
                    newCharacter.cardUnlocks = Int16(startingLevel - 1)
                    newCharacter.handSize = getHandSize(playableClass: playableClass)
                    newCharacter.health = getHealth(level:Int16(startingLevel), playableClass: playableClass)
                    
                    do {
                        try self.moc.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("Error saving new character: \(error.localizedDescription)")
                    }
                }, label: {
                    Text("Create")
                })
                .disabled(characterName.isEmpty)
                .preferredColorScheme(.dark)
            }
        }
        }
    }
}

func getComplexity(playableClass: String) -> String {
    switch playableClass{
    case "blinkblade":
        return "5/5"
    case "drifter":
        return "1/5"
    case "geminate":
        return "5/5"
    case "boneshaper":
        return "4/5"
    case "bannerspear":
        return "2/5"
    case "deathwalker":
        return "3/5"
    case "frozenfist":
        return "2/5"
    case "hive":
        return "5/5"
    case "metalmosaic":
        return "4/5"
    case "deepwraith":
        return "3/5"
    case "crashingtide":
        return "3/5"
    case "infuser":
        return "3/5"
    case "pyroclast":
        return "3/5"
    case "shattersong":
        return "3/5"
    case "trapper":
        return "4/5"
    case "painconduit":
        return "3/5"
    case "snowdancer":
        return "1/5"
    default:
        return "No display"
    }
}



func getHealth(level: Int16, playableClass: String) -> Int16 {
        return (healthDict[playableClass]?[Int16(level)])!
    }


func getHandSize(playableClass: String) -> Int16 {
    switch playableClass{
    case "blinkblade":
        return 10
    case "drifter":
        return 12
    case "geminate":
        return 14
    case "boneshaper":
        return 12
    case "bannerspear":
        return 10
    case "deathwalker":
        return 11
    case "frozenfist":
        return 8
    case "hive":
        return 11
    case "metalmosaic":
        return 9
    case "deepwraith":
        return 10
    case "crashingtide":
        return 12
    case "infuser":
        return 11
    case "pyroclast":
        return 10
    case "shattersong":
        return 10
    case "trapper":
        return 9
    case "painconduit":
        return 10
    case "snowdancer":
        return 11
    default:
        return 14
    }
}

func getLogo(playableClass: String) -> String {
    switch playableClass{
    case "blinkblade":
        return "BlinkBladeLogo_White"
    case "drifter":
        return "DrifterLogo_White"
    case "geminate":
        return "GeminateLogo_White"
    case "boneshaper":
        return "BoneShaperLogo_White"
    case "bannerspear":
        return "BannerSpearLogo_White"
    case "deathwalker":
        return "DeathWalkerLogo_White"
    case "frozenfist":
        return "FrozenFistLogo_White"
    case "hive":
        return "HiveLogo_White"
    case "metalmosaic":
        return "MetalMosaicLogo_White"
    case "deepwraith":
        return "DeepwraithLogo_White"
    case "crashingtide":
        return "CrashingTideLogo_White"
    case "infuser":
        return "InfuserLogo_White"
    case "pyroclast":
        return "PyroclastLogo_White"
    case "shattersong":
        return "ShattersongLogo_White"
    case "trapper":
        return "TrapperLogo_White"
    case "painconduit":
        return "PainConduitLogo_White"
    case "snowdancer":
        return "SnowdancerLogo_White"
    default:
        return "NoLogo"
    }
}

func getUnlockedCards (playableClass: String) -> [String] {
    let tempCards = cardStore[playableClass]
    var returnedCards : [String] = []
    for card in tempCards! {
        if card.unlocked == true {
            returnedCards.append(card.name)
        }
    }
    return returnedCards
}


func getDisplayClass(playableClass: String) -> String{
    switch playableClass{
    case "blinkblade":
        return "Blinkblade"
    case "drifter":
        return "Drifter"
    case "geminate":
        return "Geminate"
    case "boneshaper":
        return "Boneshaper"
    case "bannerspear":
        return "Banner Spear"
    case "deathwalker":
        return "Deathwalker"
    case "frozenfist":
        return "Frozen Fist"
    case "hive":
        return "HIVE"
    case "metalmosaic":
        return "Metal Mosaic"
    case "deepwraith":
        return "Deepwraith"
    case "crashingtide":
        return "Crashing Tide"
    case "infuser":
        return "Infuser"
    case "pyroclast":
        return "Pyroclast"
    case "shattersong":
        return "Shattersong"
    case "trapper":
        return "Trapper"
    case "painconduit":
        return "Pain Conduit"
    case "snowdancer":
        return "Snowdancer"
    default:
        return "No display"
    }
}


