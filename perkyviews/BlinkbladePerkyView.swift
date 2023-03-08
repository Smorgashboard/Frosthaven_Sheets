//
//  BlinkbladePerkyView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/2/23.
//

import SwiftUI
import CoreData

struct BlinkbladePerkyView: View {
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
                .padding(.trailing)
                Text("Remove one (-2) card").foregroundColor(.green)
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
                Text("Replace one (-1) card with one (+1) card").foregroundColor(.green)
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
                Text("Replace one (-1) card with one (+0 wound) card").foregroundColor(.green)
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
                Text("Replace one (+0) card with one (+1 immobilize) card").foregroundColor(.green)
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
                Text("Replace one(+0) card with one Place this card in your active area. On your next attack, discard this card to add +2 draw again card").foregroundColor(.green)
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
                .padding(.trailing)
                Text("Replace two (+1) cards with two (+2) cards").foregroundColor(.green)
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
                Text("Add one (-1) Gain 1 turn card").foregroundColor(.green)
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
                Text("Add one (+2 regenerate self draw again) card").foregroundColor(.green)
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
                Text("Whenever you short rest, you may spend one unspent item for no effect to recover a different spent item").foregroundColor(.green)
                
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
                Text("At the start of your fist turn each scenario, you may perform move 3").foregroundColor(.green)
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
                Text("Whenever you would gain immobilize prevent the condition").foregroundColor(.green)
                
            }
            .padding(.bottom)
        }
    }
}
   
