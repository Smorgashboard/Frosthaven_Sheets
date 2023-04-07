//
//  Frost_digital_sheetsApp.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI

@main
struct Frost_digital_sheetsApp: App {
    
    let persistenceController = PersistenceController.shared
    @StateObject private var purchaseManager = PurchaseManager()
    @StateObject private var settings = Settings()


    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(purchaseManager)
                .environmentObject(settings)
                .task{
                    await purchaseManager.updatePurchasedProducts()
                }
        }
    }
}
