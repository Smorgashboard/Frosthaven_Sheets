//
//  Character.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import Foundation
import CoreData

struct PlayableClass: Hashable {
    let id: String
    let label: String
    let imageName: String
    
    
}

let startingClasses: [PlayableClass] = [
PlayableClass(id: "boneshaper", label: "Boneshaper", imageName: "BoneShaperLogo_White"),
PlayableClass(id: "bannerspear", label: "Banner Spear", imageName: "BannerSpearLogo_White"),
PlayableClass(id: "drifter", label: "Drifter", imageName: "DrifterLogo_White"),
PlayableClass(id: "geminate", label: "Geminate", imageName: "GeminateLogo_White"),
PlayableClass(id: "blinkblade", label: "Blinkblade", imageName: "BlinkBladeLogo_White"),
PlayableClass(id: "deathwalker", label: "Deathwalker", imageName: "DeathWalkerLogo_White")
]

let allClasses: [PlayableClass] = [
    PlayableClass(id: "boneshaper", label: "Boneshaper", imageName: "BoneShaperLogo_WhiteSmall"),
    PlayableClass(id: "bannerspear", label: "Banner Spear", imageName: "BannerSpearLogo_White"),
    PlayableClass(id: "drifter", label: "Drifter", imageName: "DrifterLogo_White"),
    PlayableClass(id: "geminate", label: "Geminate", imageName: "GeminateLogo_White"),
    PlayableClass(id: "blinkblade", label: "Blinkblade", imageName: "BlinkBladeLogo_White"),
    PlayableClass(id: "deathwalker", label: "Deathwalker", imageName: "DeathWalkerLogo_White"),
    PlayableClass(id: "frozenfist", label: "Frozen Fist", imageName: "FrozenFistLogo_White"),
    PlayableClass(id: "hive", label: "HIVE", imageName: "HiveLogo_White"),
    PlayableClass(id: "metalmosaic", label: "Metal Mosaic", imageName: "MetalMosaicLogo_White"),
    PlayableClass(id: "deepwraith", label: "Deepwraith", imageName: "DeepwraithLogo_White"),
    PlayableClass(id: "crashingtide", label: "Crashing Tide", imageName: "CrashingTideLogo_White"),
    PlayableClass(id: "infuser", label: "Infuser", imageName: "InfuserLogo_White"),
    PlayableClass(id: "pyroclast", label: "Pyroclast", imageName: "PyroclastLogo_White"),
    PlayableClass(id: "shattersong", label: "Shattersong", imageName: "ShattersongLogo_White"),
    PlayableClass(id: "trapper", label: "Trapper", imageName: "TrapperLogo_White"),
    PlayableClass(id: "painconduit", label: "Pain Conduit", imageName: "PainConduitLogo_White"),
    PlayableClass(id: "snowdancer", label: "Snowdancer", imageName: "SnowdancerLogo_White"),

]

