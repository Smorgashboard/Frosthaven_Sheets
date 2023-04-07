//
//  DeckSelectionView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/15/23.
//
import CoreData
import SwiftUI

struct DeckSelectionView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    var characterId: UUID
    var unlockedCards: [Card]
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)

    @FetchRequest var characters: FetchedResults<Character>
    
    @State private var needMoreCardsAlert = false
    @State private var needLessCardsAlert = false
    @State private var multiSelection = Set<UUID>()
    @State private var selectedCards: [Card] = []
    @State private var  isEditing = false
    
    init(characterId: UUID, unlockedCards: [Card]) {
        self.characterId = characterId
        self.unlockedCards = unlockedCards

        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1

        self._characters = FetchRequest(fetchRequest: request)

       
    }

    func initializeMultiSelection () {
        if let lastUsedDeck = characters.first!.lastUsedDeck {
            let lastUsedDeckIds = Set(unlockedCards.filter { lastUsedDeck.contains($0.name) }.map { $0.id })
            multiSelection = lastUsedDeckIds
        }
    }
 
    var body: some View {
        
        NavigationView {
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
            VStack{
                List(unlockedCards, selection: $multiSelection) { card in
                    Text(card.name)
                    
                }
                .environment(\.editMode, .constant(EditMode.active))
                
                Text("\(multiSelection.count) selections")
                Text("Hand Size :\(characters.first!.handSize) ")
            }
            .onAppear(perform: initializeMultiSelection)
            .navigationTitle("Cards")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        // save selected items to new array
                        selectedCards = unlockedCards.filter { multiSelection.contains($0.id) }
                        
                        if selectedCards.count == characters.first!.handSize{
                            var cardarray : [String] = []
                            for card in selectedCards {
                                cardarray.append(card.name)
                            }
                            
                            do {
                                characters.first!.lastUsedDeck = cardarray
                                try moc.save()
                                
                            } catch {
                                print("Error saving new character: \(error.localizedDescription)")
                            }
                            presentationMode.wrappedValue.dismiss()
                        }
                        else if selectedCards.count > characters.first!.handSize {
                            needLessCardsAlert = true
                        }
                        else if selectedCards.count < characters.first!.handSize {
                            needMoreCardsAlert = true
                        }
                        else{
                            print("None of the above")
                        }
                        
                    }
                    .alert(isPresented: $needLessCardsAlert) {
                        Alert(
                            title: Text("Too Many Cards!"),
                            message: Text("You have selected too many cards. Please only select \(characters.first!.handSize)." ),
                            dismissButton:  .destructive(Text("Okay"))
                            )
                        }
                }
            }
        }
        }
        .alert(isPresented: $needMoreCardsAlert) {
            Alert(
                title: Text("Too Few Cards!"),
                message: Text("You have not selected enough cards. Please select exactly \(characters.first!.handSize) cards." ),
                dismissButton:  .destructive(Text("Okay"))
            )
        }
    
    
}


                               }
