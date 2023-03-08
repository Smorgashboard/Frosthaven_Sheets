//
//  CharSheetViewSubs.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//
/*
import SwiftUI
import CoreData



struct CharSheetViewSubs: View {
    //MARK: Declarations
    var characterId: UUID
    @Environment(\.managedObjectContext) private var moc
  
    @FetchRequest var character: FetchedResults<Character>
    
    init(characterId: UUID) {
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._character = FetchRequest(fetchRequest: request)
    }
    
   
    
    
    
    var body: some View 
    
    //MARK: - Subviews
    
    
    
    
    

    
        
    }


    /*var cardView: some View {
        DisclosureGroup("Unlocked Cards") {
            NavigationView {
                ZStack {
                    List {
                        ForEach(character.unlockedCards) { card in
                            NavigationLink(destination: cardDetailedView(card: card)) {
                                Image("\(card.name) Ill")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        
                    }
                    
                }
                .navigationBarTitle("Unlocked Cards")
                .background(Color.black)
            }
        }
    }*/
    
    /*var cardView2: some View{
        DisclosureGroup("Your Deck"){
            VStack{
                Text("Expanded")
                Divider()
                List(character.unlockedCards) { card in
                    Image("\(card.name)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                    VStack{
                        Text("\(card.name)")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        HStack{
                            Text("Level: ")
                            Spacer()
                            Text("Initiative: ")
                        }
                    }
                }.listStyle(SidebarListStyle())
            }
        }
        
    }*/
    


    
    struct CharSheetViewSubs_Previews: PreviewProvider {
        static var previews: some View {
            CharSheetViewSubs()
        }
    }
    
    

*/
