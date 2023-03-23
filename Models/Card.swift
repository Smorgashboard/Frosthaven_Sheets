//
//  Card.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import Foundation

class Card: Identifiable {
    let id: UUID
    let name: String
    let imgName: String
    let level: Int
    let playableChar: String
    let initiativeVal: Int
    var unlocked: Bool
    
    init(id: UUID, name: String, imgName: String, level: Int, Unlocked: Bool, PlayableClass: String, initiativeVal: Int) {
        self.id = id
        self.name = name
        self.imgName = imgName
        self.level = level
        self.initiativeVal = initiativeVal
        self.playableChar = PlayableClass
        self.unlocked = Unlocked
    }
    
}
