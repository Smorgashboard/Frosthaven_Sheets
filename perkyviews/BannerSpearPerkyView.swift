//
//  BannerSpearPerkyView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/2/23.
//

import SwiftUI
import CoreData

struct BannerSpearPerkyView: View {
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
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk2") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk2")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk3") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk3")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Replace one (-1) card with one Shield 1 draw again card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
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
                    Text("Replace one (+0) card with one (+1) Add +1  for each ally adjacent to the target card").foregroundColor(accentColor)
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
                    .padding(.trailing)
                    Text("Add one (+1) Disarm card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk8") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk8")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk9") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk9")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Add one (+2) push 1 card").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
            }
            VStack(alignment: .leading){
                HStack{
                    
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk10") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk10")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk11") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk11")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Add two (+1) draw again cards").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
                    
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk12") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk12")
                            try? moc.save()
                        }
                    ))
                    CheckBoxView(checked: Binding(
                        get: {
                            character.value(forKey: "unlockperk13") as? Bool ?? false
                        },
                        set: { newValue in
                            character.setValue(newValue, forKey: "unlockperk13")
                            try? moc.save()
                        }
                    ))
                    .padding(.trailing)
                    Text("Add two (+1) Heal self draw again cards").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                HStack{
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
                    Text("Ignore item (-1) effects and remove one (-1) card").foregroundColor(accentColor)
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
                    Text("At the end of each of your long rests, grant one ally within Range 3, Move 2").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
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
                    Text("Whenever you open a door with a move ability, add +3 Move").foregroundColor(accentColor)
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
                    Text("Once each scenario, during your turn, gain 2 Shield for the round   (REQUIRES BOTH CHECKS TO BE UNLOCKED!) ").foregroundColor(accentColor)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                .padding(.bottom)
            }
        }.padding(.horizontal)
    }
    
    
}
