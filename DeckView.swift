//
//  DeckView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI
import CoreData

struct DeckView: View {
    @Environment(\.managedObjectContext) var moc
    var characterId: UUID
    private var fontColor: Color{.white}
    private var tileColor: Color{CustomColor.otherGray}
    private var borderColor: Color{CustomColor.blueish}
    private var titleColor: Color{CustomColor.blueish}
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    @State private var showDeckSelection = false
    @FetchRequest var characters: FetchedResults<Character>
    
    init(characterId: UUID) {
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._characters = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        
        let unlockedDisplayCards = getUnlockedCards()
        let lockedDisplayCards = getLockedCards()
        
        ZStack {
            mainBackgroundGradient.ignoresSafeArea()
        VStack {
            
            Text("Cards")
                .font(.title)
                .bold()
                .foregroundColor(titleColor)
            
            if characters.first!.cardUnlocks > 0 {
                VStack{
                    Text("Congratulations! You have a new card to unlock!")
                        .bold()
                        .foregroundColor(.orange)
                    NavigationLink(destination: UnlockCardView(characterId: characterId))
                    {
                        Text("Unlock Card")
                            .foregroundColor(.blue)
                    }
                }
            }
            
            List{
                HStack{
                    Text("Recent Deck")
                        .font(.title)
                        .bold()
                        .foregroundColor(titleColor)
                    Spacer()
                    Button(action: {
                        showDeckSelection = true
                    }){
                        Text("Edit Deck")
                            .foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showDeckSelection){
                        DeckSelectionView(characterId: characterId, unlockedCards: unlockedDisplayCards)
                    }
                }
                ForEach(characters.first!.lastUsedDeck ?? ["No Previous Deck"], id: \.self) { x in
                    Text(x)
                }
                
                
                
                Section(header: Text("Unlocked Cards")) {
                    ForEach(unlockedDisplayCards, id: \.id) { card in
                        NavigationLink(destination: cardDetailedView(card: card)){
                            HStack{
                                Text(card.name)
                                Spacer()
                                Text("Level: \(card.level)")
                            }
                        }
                        .navigationBarTitle(Text("Deck View"), displayMode: .inline)
                    }
                }
                
                Section(header: Text("Locked Cards")) {
                    ForEach(lockedDisplayCards, id: \.id) { card in
                        NavigationLink(destination: cardDetailedView(card: card)){
                            HStack {
                                Text(card.name)
                                Spacer()
                                Text("Level: \(card.level)")
                            }
                        }
                        .navigationBarTitle(Text("Deck View"), displayMode: .inline)
                    }
                }
            }.scrollContentBackground(Visibility.hidden)
            
        }
    }
    }
        
    func unlockCard(cardName: String) {
            
            characters.first!.unlockedCards!.append(cardName)
            
            try? moc.save()
        }
    
    func getUnlockedCards () -> [Card] {
        let allCards = cardStore[characters.first!.playableClass!]
        let unlockedCards = Set(characters.first?.unlockedCards ?? [])
        var returnedCards : [Card] = []
        
        for card in allCards! {
            if unlockedCards.contains(card.name){
                returnedCards.append(card)
            }
        }
        return returnedCards
    }
    
    func getLockedCards () -> [Card] {
        let allCards = cardStore[characters.first!.playableClass!]
        let unlockedCards = Set(characters.first?.unlockedCards ?? [])
        var returnedCards : [Card] = []
        
        for card in allCards! {
            if !unlockedCards.contains(card.name){
                returnedCards.append(card)
            }
        }
        return returnedCards
    }
}
