//
//  cardStore.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import Foundation

var cardStore: [String: [Card]] = [
    "boneshaper": [
        Card(id: UUID(), name: "Approach Oblivion", level: 0, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 53), Card(id: UUID(), name: "Life In Death", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 91),
                                                      Card(id: UUID(), name: "Exploding Corpse", level: 0, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 21),Card(id: UUID(), name: "Returned Servant", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 81),
                                                      Card(id: UUID(), name: "Wrath Of The Turned Earth", level: 0, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 80), Card(id: UUID(), name: "Damned Horde", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 71),
                                                      Card(id: UUID(), name: "Transfer Of Essence", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 62),Card(id: UUID(), name: "Decaying Will", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 46),
                                                      Card(id: UUID(), name: "Dark Tidings", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 43),Card(id: UUID(), name: "Angry Spirits", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 76),
                                                      Card(id: UUID(), name: "Fell Remedy", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 30),Card(id: UUID(), name: "Flow Of The Black River", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 18),
                                                      Card(id: UUID(), name: "Command The Wretched", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 83),Card(id: UUID(), name: "Eternal Torment", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 70),
                                                      Card(id: UUID(), name: "Malicious Conversion", level: 1, Unlocked: true, PlayableClass: "Boneshaper", initiativeVal: 26),Card(id: UUID(), name: "Unearthed Horror", level: 2, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 94),
                                                      Card(id: UUID(), name: "Bone Dagger", level: 2, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 29),Card(id: UUID(), name: "Grave Digging", level: 3, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 96),
                                                      Card(id: UUID(), name: "Putrid Cloud", level: 3, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 28),Card(id: UUID(), name: "Critical Failure", level: 4, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 95),
                                                      Card(id: UUID(), name: "Flesh Shield", level: 4, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 16),Card(id: UUID(), name: "Unforgivable Methods", level: 5, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 98),
                                                      Card(id: UUID(), name: "Solid Bones", level: 5, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 32),Card(id: UUID(), name: "Rotting Multitude", level: 6, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 66),
                                                      Card(id: UUID(), name: "Twisted Decree", level: 6, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 85),Card(id: UUID(), name: "Recycled Limbs", level: 7, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 52),
                                                      Card(id: UUID(), name: "Soul Claim", level: 7, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 23),Card(id: UUID(), name: "Endless Numbers", level: 8, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 86),
                                                      Card(id: UUID(), name: "Wailing From Beyond", level: 8, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 73),Card(id: UUID(), name: "Unholy Prowess", level: 9, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 97),
                                                      Card(id: UUID(), name: "Behold The Shrouded Sun", level: 9, Unlocked: false, PlayableClass: "Boneshaper", initiativeVal: 10)
    ],
        // ... other cards for boneshaper
    "bannerspear": [
        Card(id: UUID(), name: "Test1", level: 1, Unlocked: true, PlayableClass: "bannerspear", initiativeVal: 97),
        Card(id: UUID(), name: "Test2", level: 2, Unlocked: false, PlayableClass: "bannerSpear", initiativeVal: 10)
        // ... other cards for bannerspear
    ],
    // ... other playable classes
]

