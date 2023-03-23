//
//  PerkPointView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/3/23.
//
import CoreData
import SwiftUI

struct PerkPointView: View {
    @Environment(\.managedObjectContext) var moc
    var characterId: UUID
    @FetchRequest var characters: FetchedResults<Character>
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
        VStack {
            Text("Perk Points:")
                .foregroundColor(titleColor)
                .font(.title3)
                .bold()
                .padding(.top)
            Divider()
                .foregroundColor(.black)
                .padding(.bottom)
                .bold()
            Grid {
                GridRow {
                    HStack{
                        ForEach(1..<4) { i in // Assuming 18 checkboxes
                            CheckBoxView(checked: Binding(
                                get: { character.perkPoints >= i },
                                set: { newValue in
                                    if newValue {
                                        character.perkPoints += 1
                                    } else {
                                        character.perkPoints -= 1
                                    }
                                    try? moc.save()
                                }
                            ))
                        }
                        HStack{
                            ForEach(4..<7) { i in // Assuming 18 checkboxes
                                CheckBoxView(checked: Binding(
                                    get: { character.perkPoints >= i },
                                    set: { newValue in
                                        if newValue {
                                            character.perkPoints += 1
                                        } else {
                                            character.perkPoints -= 1
                                        }
                                        try? moc.save()
                                    }
                                ))
                            }
                        }
                        .padding(.horizontal)
                        ForEach(7..<10) { i in // Assuming 18 checkboxes
                            CheckBoxView(checked: Binding(
                                get: { character.perkPoints >= i },
                                set: { newValue in
                                    if newValue {
                                        character.perkPoints += 1
                                    } else {
                                        character.perkPoints -= 1
                                    }
                                    try? moc.save()
                                }
                            ))
                        }
                    }
                }
                GridRow {
                    HStack{
                        ForEach(10..<13) { i in // Assuming 18 checkboxes
                            CheckBoxView(checked: Binding(
                                get: { character.perkPoints >= i },
                                set: { newValue in
                                    if newValue {
                                        character.perkPoints += 1
                                    } else {
                                        character.perkPoints -= 1
                                    }
                                    try? moc.save()
                                }
                            ))
                        }
                        HStack{
                            ForEach(13..<16) { i in // Assuming 18 checkboxes
                                CheckBoxView(checked: Binding(
                                    get: { character.perkPoints >= i },
                                    set: { newValue in
                                        if newValue {
                                            character.perkPoints += 1
                                        } else {
                                            character.perkPoints -= 1
                                        }
                                        try? moc.save()
                                    }
                                ))
                            }
                        }
                        .padding([.leading, .trailing])
                        ForEach(16..<19) { i in // Assuming 18 checkboxes
                            CheckBoxView(checked: Binding(
                                get: { character.perkPoints >= i },
                                set: { newValue in
                                    if newValue {
                                        character.perkPoints += 1
                                    } else {
                                        character.perkPoints -= 1
                                    }
                                    try? moc.save()
                                }
                            ))
                        }
                    }                        }
            }
        }
        .padding(.bottom)
        
        
    }
}
