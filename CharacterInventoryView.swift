//
//  CharacterInventoryView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/6/23.
//

import SwiftUI
import CoreData

struct CharacterInventoryView: View {
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
        let charItems : [Int] = characters.first!.inventoryItems!
        let character = characters.first!
        let filteredItems = items.filter { item in
            charItems.contains(item.number)
        }
        VStack{
                Text("Your Items:")
                .font(.title)
                .fontWeight(.bold)
            List{
                ForEach(filteredItems){ item in
                    DisclosureGroup("\(item.name)") {
                            HStack{
                                VStack{
                                    HStack{
                                        switch item.type{
                                        case "boots":
                                            Image("BootsLogo_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "chest":
                                            Image("ChestLogo_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "1 hand" :
                                            Image("1HandLogo_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "2 hand" :
                                            Image("2HandLogo_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "helmet":
                                            Image("HelmetLogo_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "potion" :
                                            Image("PotionLogo_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        default:
                                            Text("\(item.type)")
                                        }
                                        
                                        switch item.use{
                                        case "tap":
                                            Image("TapIcon_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "lost":
                                            Image("LostIcon_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "flip":
                                            Image("FlipIcon_White")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 25)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 5)
                                        case "perm":
                                            Text("")
                                        default:
                                            Text("\(item.use)")
                                        }
                                    }
                                    Text("Cost: \(item.cost)")
                                }
                                Text("\(item.description)")
                            }
                        HStack{
                            Button("Remove") {
                                do {
                                    let charit = character.inventoryItems!.firstIndex(where: {$0 == item.number})
                                    character.inventoryItems!.remove(at: charit!)
                                    try moc.save()
                                }catch {
                                    print("Error saving new character: \(error.localizedDescription)")
                                }
                                    
                            }
                            
                        }
                    }
                }
            }
            NavigationLink(destination: AddToInventoryView(characterId: characterId)) {
                Text("Add new items.")
            }
            
        }.preferredColorScheme(.dark)
    }
}

