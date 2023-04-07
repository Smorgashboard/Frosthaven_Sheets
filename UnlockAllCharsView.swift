//
//  UnlockAllCharsView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/23/23.
//

import SwiftUI
import StoreKit



struct UnlockAllCharsView: View {
    
    @EnvironmentObject
        private var purchaseManager: PurchaseManager
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    private var fontColor: Color{.white}
    private var tileColor: Color{CustomColor.otherGray}
    private var borderColor: Color{CustomColor.blueish}
    private var titleColor: Color{CustomColor.blueish}
    
    @State private var purchaseCompleted: Bool = false
    
    let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    let logos: [String] = [
        "FrozenFistLogo_White",
        "HiveLogo_White",
        "MetalMosaicLogo_White",
        "DeepwraithLogo_White",
        "CrashingTideLogo_White",
        "InfuserLogo_White",
        "PyroclastLogo_White",
        "ShattersongLogo_White",
        "TrapperLogo_White",
        "PainConduitLogo_White",
        "SnowdancerLogo_White"]

    var body: some View {
        NavigationView{
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
                VStack{
                    VStack{
                        Text("Unlock All Characters")
                            .font(.title)
                            .foregroundColor(titleColor)
                            .padding(.top)
                        Divider()
                            .bold()
                            .foregroundColor(titleColor)
                        LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                            ForEach(logos, id: \.self) { logo in
                                Image(logo)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .frame(maxWidth: 25, maxHeight: 25)
                            }
                        }
                        .padding()
                        Text("Description: Purchasing this will unlock the non-starter Frosthaven Characters.")
                            .foregroundColor(fontColor)
                        Divider()
                        ForEach(purchaseManager.products) { product in
                            Button {
                                Task {
                                    do {
                                        try await purchaseManager.purchase(product)
                                        completePurchase()
                                    } catch {
                                        print(error)
                                    }
                                }
                            } label: {
                                Text("\(product.displayPrice) - \(product.displayName)")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.blue)
                                    .clipShape(Capsule())
                            }
                        }
                        Divider()
                    }
                    .background(tileColor)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                }
                .task {
                    Task {
                        do {
                            try await purchaseManager.loadProducts()
                        } catch {
                            print(error)
                        }
                    }
                }
                NavigationLink(destination: CharacterSelectionView(), isActive: $purchaseCompleted) {
                                   EmptyView()
                               }
            }
            
        }
        }
    func completePurchase() {
            self.purchaseCompleted = true
        }
    
    }


