//
//  MasteryGoals.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/3/23.
//

import SwiftUI
import CoreData

struct MasteryGoalsView: View {
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
    
    var masteries: [String] {
        guard let playableClass = characters.first?.playableClass else { return [] }
        return masteriesDict[playableClass] ?? []
    }
    
    var body: some View {
        let character = characters.first!
        VStack(alignment: .center){
            
            Text("Mastery Goals")
        }
        .foregroundColor(.green)
        .multilineTextAlignment(.center)
        .padding(.bottom)
        VStack(alignment: .leading){
                
                ForEach(0 ..< masteries.count, id: \.self) { x in
                    HStack{
                        CheckBoxView(checked: Binding(
                            get: {
                                character.value(forKey: "masteryGoals\(x + 1)" ) as? Bool ?? false
                            },
                            set: { newValue in
                                character.setValue(newValue, forKey: "masteryGoals\(x + 1)")
                                try? moc.save()
                            }
                        ))
                        .padding(.trailing)
                        Text("\(masteries[x])")
                            .foregroundColor(.green)
                            .padding(.bottom)
                    }
            }
        }
    }
}

