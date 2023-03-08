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
            Text("Perks")
                .foregroundColor(.green)
                .padding(.bottom)
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
                Text("Replace one (-1) card with one (shield 1 draw again) card").foregroundColor(.green)
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
                Text("Replace one (+0) card with one (+1) Add +1  for each ally adjacent to the target card").foregroundColor(.green)
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
                Text("Add one (+1 disarm) card").foregroundColor(.green)
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
                Text("Add one (+2 push 1) card").foregroundColor(.green)
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
                Text("Add two (+1 draw again) cards").foregroundColor(.green)
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
                Text("Add two (+1 health self draw again) cards").foregroundColor(.green)
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
                Text("Ignore item (-1) effects and remove one (-1) card").foregroundColor(.green)
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
                Text("At the end of each of your long rests, grant one ally within range 3, move 2").foregroundColor(.green)
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
                Text("Whenever you open a door with a move ability, add +3 move").foregroundColor(.green)
                
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
                Text("Once each scenario, during your turn, gain 2 shield for the round   (REQUIRES BOTH CHECKS TO BE UNLOCKED!) ").foregroundColor(.green)
                
            }
            .padding(.bottom)
        }
    }
    
    
}
