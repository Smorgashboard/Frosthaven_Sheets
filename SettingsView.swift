//
//  SettingsView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 4/4/23.
//
import StoreKit
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("App Settings")){
                    Toggle("Conner Mode", isOn: $settings.connerMode)
                    Toggle("Hide Class Names", isOn: $settings.hideClassNames)
                }
                Section(header: Text("Purchase Settings")){
                    Button {
                        Task {
                            do {
                                try await AppStore.sync()
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        Text("Restore Purchases")
                    }
                }
                Section(header: Text("Support")){
                    Text("Support Email: support@soteriatechsolutions.com")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
