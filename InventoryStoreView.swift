//
//  InventoryStoreView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/6/23.
//

import SwiftUI

struct InventoryStoreView : View{
    @State private var searchText = ""
    
    var filteredItems: [InventoryItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View{
       
        NavigationView{
            List{
                ForEach(filteredItems) { item in
                    Text(item.name)
                }
                .navigationTitle("Items")
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .preferredColorScheme(.dark)
    }
}
struct InventoryStoreView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryStoreView()
    }
}
