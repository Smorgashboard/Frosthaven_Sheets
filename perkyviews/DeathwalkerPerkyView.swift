//
//  DeathwalkerPerkyView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/2/23.
//

import SwiftUI
import CoreData

struct DeathwalkerPerkyView: View {
    @Environment(\.managedObjectContext) var moc
    var characterId: UUID
    @FetchRequest var characters: FetchedResults<Character>
    private var accentColor: Color{.white}
    private var titleColor: Color{CustomColor.blueish}
    
    init(characterId: UUID){
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._characters = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        let character = characters.first!
        VStack{
            VStack{
                HStack{
                    Text("Perks")
                        .foregroundColor(titleColor)
                        .font(.title3)
                        .bold()
                        .padding(.vertical)
                    
                    Menu{
                        NavigationLink(destination: AttackDeckPreview(characterId: characterId)) {
                            Text("View Current Modifier Deck")
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 40)
                        }
                        .background(Color.black)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 24))
                    }
                    .navigationTitle("Perks")
                }
                Divider()
                    .foregroundColor(titleColor)
                    .bold()
            }
            VStack(alignment: .leading){
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk1") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk1")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Remove two (-1) cards").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk2") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk2")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Replace one (-2) card with one (+0) card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk3") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk3")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk4") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk4")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk5") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk5")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Replace one (-1) card with one (+1) card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk6") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk6")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk7") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk7")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk8") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk8")
                            try? moc.save()
                        }
                    ))
                    
                    .padding(.trailing)
                    Text("Replace one (+0) card with one (+1) Curse card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk9") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk9")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk10") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk10")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Add one (+2) Dark card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk11") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk11")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk12") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk12")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Add one Stun draw again and one Muddle draw again card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk13") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk13")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk14") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk14")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Add two Heal +1, Target 1 ally draw again cards").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk15") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk15")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Ignore scenario effects").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
            }
            VStack(alignment: .leading){
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk16") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk16")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Whenever you long rest, you may move one Deathwalker token up to three hexes").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk17") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk17")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Whenever you short rest, you may consume Dark to perform Muddle, Curse Range 2 as if you were occupying a hex with a Deathwalker token").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk18") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk18")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("While you are occupying a hex with a Deathwalker Token, all attacks targeting you gain disadvantage").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                .padding(.bottom)
            }
        }.padding(.horizontal)
    }
}
   
