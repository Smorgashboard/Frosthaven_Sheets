//
//  CardListView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/19/23.
//

import SwiftUI

struct CardListView: View {
    @EnvironmentObject private var purchaseManager: PurchaseManager
    @EnvironmentObject var settings: Settings
    @State private var selectedClass = "boneshaper"
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        NavigationView {
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
                VStack {
                    Form {
                        Section(header: Text("Class")) {
                            Menu(content: {
                                Picker("Playable Class", selection: $selectedClass) {
                                    if settings.hideClassNames{
                                        if purchaseManager.hasUnlockedChars {
                                            ForEach(allClasses, id: \.id) { x in
                                                Image(x.imageName)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(maxWidth: 25, maxHeight: 25)
                                                    .tag(x.id)
                                            }
                                        } else {
                                            ForEach(startingClasses, id: \.id) { x in
                                                Image(x.imageName)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(maxWidth: 25, maxHeight: 25, alignment: .center)
                                                    .tag(x.id)
                                            }
                                        }
                                    } else {
                                        if purchaseManager.hasUnlockedChars {
                                            ForEach(allClasses, id: \.id) { x in
                                                HStack{
                                                    Text(x.label)
                                                    Image(x.imageName)
                                                }
                                                .tag(x.id)
                                            }
                                        } else {
                                            ForEach(startingClasses, id: \.id) { x in
                                                HStack{
                                                    Text(x.label)
                                                    Image(x.imageName)
                                                }
                                                .tag(x.id)
                                            }
                                        }
                                    }
                                }
                            }, label: {
                                HStack{
                                    Text(getDisplayClass(playableClass: selectedClass))
                                    Spacer()
                                    Image(getLogo(playableClass: selectedClass))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 25, maxHeight: 25)
                                }
                            })
                        }
                        Section(header: Text("Cards")){
                            List(cardStore[selectedClass] ?? [], id: \.id) { card in
                                NavigationLink(destination: cardDetailedView(card: card)) {
                                    VStack(alignment: .leading) {
                                        Text(card.name)
                                        Text("Level: \(card.level)")
                                    }
                                }
                            }
                            .scrollContentBackground(Visibility.hidden)
                        }
                    }
                    .scrollContentBackground(Visibility.hidden)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    
                   
            }
        }
        }
        .navigationBarTitle("Card List", displayMode: .inline)
        .toolbarBackground(Color.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
