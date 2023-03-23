//
//  InventoryStoreView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/6/23.
//

import SwiftUI

struct InventoryStoreView : View{
    @State private var searchText = ""
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    var filteredItems: [InventoryItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View{
        
            
            NavigationView{
                ZStack{
                    mainBackgroundGradient.ignoresSafeArea()
                List{
                    ForEach(filteredItems) { item in
                        VStack{
                            DisclosureGroup("\(item.name)") {
                                HStack{
                                    Text("Cost: \(item.cost)")
                                    Divider()
                                    Text(item.description)
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
                                
                            }
                        }
                    }
                    .navigationTitle("Items")
                }.scrollContentBackground(Visibility.hidden)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .preferredColorScheme(.dark)
        }
    }
}
struct InventoryStoreView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryStoreView()
    }
}
