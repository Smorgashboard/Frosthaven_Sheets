//
//  MainView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/17/23.
//

import SwiftUI


struct MainView: View {
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    let fontGradient = LinearGradient(
        gradient: Gradient(colors: [Color.red, Color.orange, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                mainBackgroundGradient
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        
                        HStack{
                            NavigationLink(destination: FAQView()) {
                                Text("FAQ")
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: 150, maxHeight: 40)
                                
                            }
                            .background(.black)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            Spacer()
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gear")
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: 50, maxHeight: 40)
                            }
                            .background(.black)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        
                    }
                    Spacer()
                    Image("FrosthavenLogo")
                        .resizable()
                        .scaledToFit()
                    Text("Frosthacker \nCharacter \nSheets")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.vertical)
                        .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: CharacterSelectionView()) {
                        Text("Your Characters")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 40)
                    }.background(.black)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    HStack{
                        NavigationLink(destination: CardListView()){
                            Text("Card List")
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 40)
                        }
                        .background(.black)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        
                        NavigationLink(destination: InventoryStoreView()){
                            Text("Item List")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 40)
                        }
                        .background(.black)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
                
        }.preferredColorScheme(.dark)
        
    }
            
        
    
    func openMailApp() {
        guard let url = URL(string: "mailto:support@example.com?subject=Support Request") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Cannot open mail app")
        }
    }

    
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
