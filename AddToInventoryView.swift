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
    @State private var disclosureExpanded = true
    var characterId: UUID
    @FetchRequest var characters: FetchedResults<Character>
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    private var fontColor: Color{.white}
    private var tileColor: Color{CustomColor.otherGray}
    private var borderColor: Color{CustomColor.blueish}
    private var titleColor: Color{CustomColor.blueish}
    
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
        
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
            //at one point there was a list here
                ScrollView{
                    VStack{
                        DisclosureGroup(isExpanded: $disclosureExpanded, content: {
                        ForEach(filteredItems) { item in
                            VStack{
                                DisclosureGroup("\(item.name)") {
                                    VStack{
                                        HStack{
                                            Text("Cost: \(item.cost)")
                                                .foregroundColor(fontColor)
                                            Divider()
                                            Text(item.description)
                                                .foregroundColor(fontColor)
                                            Divider()
                                            VStack{
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
                                        }
                                        Divider()
                                        HStack{
                                            Button("Add") {
                                                do {
                                                    character.inventoryItems!.insert(item.number, at: 0)
                                                    isShowingAlert = true
                                                    try moc.save()
                                                    
                                                } catch {
                                                    print("Error saving new item: \(error.localizedDescription)")
                                                }
                                                
                                            }
                                            .contentShape(Rectangle())
                                            .padding()
                                            .background(Color(.systemBlue))
                                            .foregroundColor(.white)
                                            .clipShape(Capsule())
                                        }
                                    }
                                }
                                .padding(.all)
                                .background(CustomColor.darkGray)
                                .foregroundColor(CustomColor.blueish)
                                
                            }
                            .background(CustomColor.darkGray)
                            
                            //}
                        }
                        .navigationTitle("Items")
                        .foregroundColor(.white)
                    }, label: {
                        Text("All Items:")
                            .foregroundColor(CustomColor.blueish)
                            .multilineTextAlignment(.center)
                            .font(.title3)
                            .bold()
                    })
                    .padding(.all)
                                        
                    }
                }
                .background(tileColor)
                .cornerRadius(10)
                .padding()
                .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                //}.scrollContentBackground(Visibility.hidden)
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Item added to Invetory"),
                message: Text("Added!" )) }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .preferredColorScheme(.dark)
    }
    
}

