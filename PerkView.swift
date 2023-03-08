//
//  PerkView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/1/23.
//
/*
import SwiftUI

struct PerkView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Character.entity(), sortDescriptors: [])
    var characters: FetchedResults<Character>
    
    
    let playableClass: String
    let perks: [String: (String, Int, Int)]
    
    init(playableClass: String) {
        self.playableClass = playableClass
        self.perks = perkDict[playableClass] ?? [:]
    }
    
    var body: some View {
        VStack {
            ForEach(perks, id: \.key) { perk in
                let perkNumber = Int(String(perk.key.last!)) ?? 1
                let character = characters.first
                if let perkText = perk.value.0, let perkUnlocks = perk.value.1, perkUnlocks > 0 {
                    HStack {
                        ForEach(1...perkUnlocks, id: \.self) { index in
                            CheckBoxView(checked: Binding(
                                get: {
                                    character?.value(forKey: "unlockperk\(perkNumber + index)") as? Bool ?? false
                                },
                                set: { newValue in
                                    character?.setValue(newValue, forKey: "unlockperk\(perkNumber + index)")
                                    try? moc.save()
                                }
                            ))
                        }
                        Text(perkText).foregroundColor(.green)
                        Spacer()
                    }
                }
            }
        }
    }
}










*/
