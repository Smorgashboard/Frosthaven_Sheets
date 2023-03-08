//
//  Character.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import Foundation
import CoreData

enum PlayableClass: String, CaseIterable, Identifiable {
    case boneshaper
    case bannerspear
    case drifter
    case geminate
    case blinkblade
    case deathwalker
    
    var id: String { self.rawValue }
}



