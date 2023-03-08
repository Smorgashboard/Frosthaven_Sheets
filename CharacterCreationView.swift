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
    
    @State private var characterName = ""
    @State private var playableClass = PlayableClass.boneshaper
    @State private var startingLevel = 1
    @State private var selectedKey = "Dangerous Game"

    
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    Section(header: Text("Character Information")) {
                        TextField("Character Name", text: $characterName)
                        Picker("Playable Class", selection: $playableClass) {
                            ForEach(PlayableClass.allCases, id: \.self) {
                                Text($0.rawValue.capitalized).tag($0)
                            }
                        }
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
                .toolbarColorScheme(.dark, for: .navigationBar)
                .navigationBarTitle("Create Character", displayMode: .inline)
                .toolbarBackground(Color.black, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                
                Button(action: {
                    let newCharacter = Character(context: self.moc)
                    newCharacter.name = characterName
                    newCharacter.startingLevel = Int16(startingLevel)
                    newCharacter.level = Int16(startingLevel)
                    newCharacter.playableClass = playableClass.rawValue
                    newCharacter.id = UUID()
                    newCharacter.logo = getLogo(playableClass: playableClass.rawValue)
                    newCharacter.retirementGoal = selectedKey
                    newCharacter.displayClass = getDisplayClass(playableClass: playableClass.rawValue)
                    newCharacter.xp = xpDict[startingLevel]!
                    newCharacter.inventoryItems = []
                    
                    do {
                        try self.moc.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("Error saving new character: \(error.localizedDescription)")
                    }
                }, label: {
                    Text("Create")
                })
                .preferredColorScheme(.dark)
            }
        }
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
    default:
        return "NoLogo"
    }
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
    default:
        return "No display"
    }
}

struct CharacterCreationView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCreationView()
    }
}
