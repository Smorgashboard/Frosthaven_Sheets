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


    var body: some Scene {
        WindowGroup {
            MainScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
