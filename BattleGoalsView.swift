//
//  BattleGoalView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/21/23.
//

import SwiftUI
import CoreData

struct BattleGoalsView: View {
    @Environment(\.managedObjectContext) var moc
    var characterId: UUID
    @FetchRequest var characters: FetchedResults<Character>
    
    @State private var options: [String] = []
    @State private var selectedOption: (String, Int)? = nil
    @State private var showOptions = true
    
    init(characterId: UUID){
        self.characterId = characterId
        
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._characters = FetchRequest(fetchRequest: request)

        
    }
    
    var body: some View {
        VStack{
            if options.isEmpty && showOptions {
                Text("Select A Battle Goal!")
                Button("Start") {
                    options = Array(battleGoals.keys).shuffled().prefix(3).map { $0 }
                }
                .padding()
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Capsule())
                if characters.first!.lastBattleGoal != nil{
                    Button("Last Battle Goal") {
                        let oldGoal = battleGoals[characters.first!.lastBattleGoal!]
                        print(oldGoal!.0)
                        selectedOption = (characters.first!.lastBattleGoal!, oldGoal!.1)
                        showOptions = false
                    }
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            } else if showOptions {
                ForEach(options, id: \.self) { option in
                    if let goal = battleGoals[option] {
                        Button(action: {
                            selectedOption = (option, goal.1)
                            showOptions = false
                            //save to lastBattleGoal in CD
                            characters.first!.lastBattleGoal = option
                            
                            try? moc.save()
                        }) {
                            VStack {
                                Text(option)
                                    .multilineTextAlignment(.center)
                                    .bold()
                                    .fixedSize(horizontal: false, vertical: false)
                                Text("Goal: \(goal.0)\nCheckmarks: \(goal.1)")
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: false)
                                    .bold()
                            }
                            .padding()
                            .background(Color.blue)
                            
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                        }
                    }
                }
            } else {
                if let selectedOption = selectedOption, let goal = battleGoals[selectedOption.0] {
                    VStack {
                        Text("Selected Goal: \(selectedOption.0)")
                            .multilineTextAlignment(.center)
                            .bold()
                        Text("Goal: \(goal.0)\nCheckmarks: \(goal.1)")
                            .multilineTextAlignment(.center)
                            .bold()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            
        }
    }
}


