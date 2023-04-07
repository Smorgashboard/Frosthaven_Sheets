//
//  unlockCardView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/17/23.
//
import SwiftUI
import CoreData

struct UnlockCardView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    var characterId: UUID
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)

    @FetchRequest var characters: FetchedResults<Character>
    
    init(characterId: UUID){
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._characters = FetchRequest(fetchRequest: request)
    }
    
    @State private var availableCards: [Card] = []
    

    var body: some View {
        ZStack{
            mainBackgroundGradient.ignoresSafeArea()
            VStack {
                Text("Unlocks: \(characters.first!.cardUnlocks)")
                List(availableCards, id: \.id) { card in
                    HStack {
                        // Display card details
                        VStack(alignment: .leading) {
                            Text(card.name)
                            Text("Level: \(card.level)")
                            Text("Initiative: \(card.initiativeVal)")
                        }
                        Spacer()
                        Button("Unlock") {
                            unlockCard(card)
                        }
                    }
                }.scrollContentBackground(Visibility.hidden)
            }
            .onAppear(perform: filterCards)
        }
    }

    private func filterCards() {
        guard let character = characters.first else {
            return
        }

        let playableClass = character.playableClass ?? ""
        let level = Int(character.level)
        let unlockedCards = character.unlockedCards ?? []

        availableCards = cardStore[playableClass]?.filter { card in
            return card.level <= level && !unlockedCards.contains(card.name)
        } ?? []
    }

    private func unlockCard(_ card: Card) {
        guard let character = characters.first else {
            return
        }

        var updatedUnlockedCards = character.unlockedCards ?? []
        updatedUnlockedCards.append(card.name)
        character.unlockedCards = updatedUnlockedCards

        do {
            try viewContext.save()
            character.cardUnlocks = character.cardUnlocks - 1
            try moc.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error unlocking card: \(error)")
        }
    }

}
