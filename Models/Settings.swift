//
//  Settings.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 4/4/23.
//

import SwiftUI
import Combine

class Settings: ObservableObject {
    @Published var connerMode: Bool {
        didSet {
            UserDefaults.standard.set(connerMode, forKey: "connerMode")
        }
    }
    @Published var hideClassNames: Bool {
        didSet {
            UserDefaults.standard.set(hideClassNames, forKey: "hideClassNames")
        }
    }
    
    init() {
            self.connerMode = UserDefaults.standard.bool(forKey: "connerMode")
            self.hideClassNames = UserDefaults.standard.bool(forKey: "hideClassNames")
        }
}
