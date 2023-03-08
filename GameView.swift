//
//  GameView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI
import CoreData

struct GameView: View {
    var characterId: UUID
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest var character: FetchedResults<Character>
    
    static var  accentColor: Color{.green}
    
    init(characterId: UUID) {
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._character = FetchRequest(fetchRequest: request)
        
    }
    
    var lumber: Binding<Int16> {
        Binding(
            get: { character.first?.lumber ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.lumber = newValue
                try? moc.save()
            }
        )
    }
    
    var metal: Binding<Int16> {
        Binding(
            get: { character.first?.metal ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.metal = newValue
                try? moc.save()
            }
        )
    }
    
    var hide: Binding<Int16> {
        Binding(
            get: { character.first?.hide ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.hide = newValue
                try? moc.save()
            }
        )
    }
    
    var arrowvine: Binding<Int16> {
        Binding(
            get: { character.first?.arrowvine ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.arrowvine = newValue
                try? moc.save()
            }
        )
    }
    
    var axenut: Binding<Int16> {
        Binding(
            get: { character.first?.axenut ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.axenut = newValue
                try? moc.save()
            }
        )
    }
    
    var corpsecap: Binding<Int16> {
        Binding(
            get: { character.first?.corpsecap ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.corpsecap = newValue
                try? moc.save()
            }
        )
    }
    
    var flamefruit: Binding<Int16> {
        Binding(
            get: { character.first?.flamefruit ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.flamefruit = newValue
                try? moc.save()
            }
        )
    }
    
    var rockroot: Binding<Int16> {
        Binding(
            get: { character.first?.rockroot ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.rockroot = newValue
                try? moc.save()
            }
        )
    }
    
    var snowthistle: Binding<Int16> {
        Binding(
            get: { character.first?.snowthistle ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.snowthistle = newValue
                try? moc.save()
            }
        )
    }
    
    var xp: Binding<Int16> {
        Binding(
            get: { character.first?.xp ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.xp = newValue
                try? moc.save()
            }
        )
    }
    
    var gold: Binding<Int16> {
        Binding(
            get: { character.first?.gold ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.gold = newValue
                try? moc.save()
            }
        )
    }
    
    var level: Binding<Int16> {
        Binding(
            get: { character.first?.level ?? 1},
            set: { newValue in
                guard let character = character.first else { return }
                character.level = newValue
                try? moc.save()
            }
        )
    }
    var body: some View {
        VStack{
            BattleGoalsView()
            Divider()
            VStack{
                Text("Stats:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                HStack{
                    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
                    }
                    Divider()
                    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
                    }
                }
                .frame(height:35)
                Divider()
                VStack{
                    Text("Your Items:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                }
                Divider()
                VStack{
                Text("Attack Deck:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                }
                Divider()
                VStack{
                    Text("Loot:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                    Divider()
                    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
                    }
                    Divider()
                    ScrollView{
                        ResourceTrackerView(axenut: axenut, lumber: lumber, metal: metal, hide: hide, arrowvine: arrowvine, corpsecap: corpsecap, flamefruit: flamefruit, rockroot: rockroot, snowthistle: snowthistle)
                    }
                }
            }
            Divider()
        }.preferredColorScheme(.dark)
    }
}


