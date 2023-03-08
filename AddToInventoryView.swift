//
//  AddToInventoryView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/6/23.
//

import SwiftUI
import CoreData


struct AddToInventoryView: View {
   @Environment(\.managedObjectContext) var moc
    @State private var isShowingAlert = false
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
    
    @State private var searchText = ""
    
    var filteredItems: [InventoryItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View{
        let character = characters.first!
        NavigationView{
            List{
                ForEach(filteredItems) { item in
                    HStack{
                        Text(item.name)
                        Button("Add") {
                            do {
                                character.inventoryItems!.insert(item.number, at: 0)
                                isShowingAlert = true
                                try moc.save()
                                
                            } catch {
                                print("Error saving new character: \(error.localizedDescription)")
                            }

                        }
                        .alert(isPresented: $isShowingAlert) {
                            Alert(
                                title: Text("Item added to Invetory"),
                                message: Text("Added!" )) }
                    }
                }
                .navigationTitle("Items")
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .preferredColorScheme(.dark)
    }
    
}

