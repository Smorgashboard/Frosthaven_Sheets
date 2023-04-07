//
//  AttackDeckPreview.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/30/23.
//

import SwiftUI
import CoreData

struct AttackDeckPreview: View{
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest var character: FetchedResults<Character>
    var characterId: UUID
    
    private var fontColor: Color{.white}
    private var tileColor: Color{CustomColor.otherGray}
    private var borderColor: Color{CustomColor.blueish}
    private var titleColor: Color{CustomColor.blueish}
    @State private var showCards = false
    @State private var allCards = [""]
    @State private var InfuserAlert: Bool = false
    
    init(characterId: UUID) {
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._character = FetchRequest(fetchRequest: request)
        
    }
    
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    func getAllCards() -> [String] {
        let charPC = character.first!.playableClass
        switch charPC {
        case "blinkblade":
            return buildBlinkDeck()
        case "drifter":
            return buildDriftDeck()
        case "geminate":
            return buildGemDeck()
        case "boneshaper":
            return buildBoneDeck()
        case "bannerspear":
            return buildBannerDeck()
        case "deathwalker":
            return buildDeathDeck()
        case "hive":
            return buildHiveDeck()
        case "painconduit":
            return buildPainDeck()
        case "shattersong":
            return buildShatterDeck()
        case "deepwraith":
            return buildDeepDeck()
        case "pyroclast":
            return buildPyroDeck()
        case "snowdancer":
            return buildSnowDeck()
        case "trapper":
            return buildTrapDeck()
        case "crashingtide":
            return buildCrashDeck()
        case "infuser":
            return buildInfuserDeck()
        case "frozenfist":
            return buildFistDeck()
        case "metalmosaic":
            return buildMetalDeck()
        default:
            return ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        }
    }
    
    func buildBoneDeck() -> [String] {
        
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["bone1"])
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["bone1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["bone2"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["bone2"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["0"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["bone3"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["bone3"])
        }
        if character.first!.unlockperk8 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["bone3"])
        }
        if character.first!.unlockperk9 == true {
            tempDeck.append("bone4")
            tempDeck.append("bone4")
            tempDeck.append("bone4")
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("bone4")
            tempDeck.append("bone4")
            tempDeck.append("bone4")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("bone5")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("bone5")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("bone5")
        }
        if character.first!.unlockperk14 == true {
            tempDeck.append("+1")
            tempDeck.append("+1")
        }
       
        return tempDeck
    }
    
    func buildBlinkDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-2")
            tempDeck.remove(at: index!)
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["blink1"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["blink1"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["blink2"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["blink2"])
        }
        if character.first!.unlockperk8 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["blink3"])
        }
        if character.first!.unlockperk9 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["blink3"])
        }
        if character.first!.unlockperk10 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["blink3"])
        }
        if character.first!.unlockperk11 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
        }
        if character.first!.unlockperk12 == true{
            tempDeck.append("blink4")
        }
        if character.first!.unlockperk13 == true{
            tempDeck.append("blink4")
        }
        if character.first!.unlockperk14 == true{
            tempDeck.append("blink5")
        }
        if character.first!.unlockperk15 == true{
            tempDeck.append("blink5")
        }
        return tempDeck
        
    }
    
    func buildGemDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["0"])
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem1"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem2"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem2"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem3"])
        }
        if character.first!.unlockperk8 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem3"])
        }
        if character.first!.unlockperk9 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem4"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["gem4"])
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("gem5")
            tempDeck.append("gem5")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("gem6")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("gem7")
            
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("gem7")
            
        }
        return tempDeck
        
    }
    
    func buildDeathDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            var index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["0"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["death1"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["death1"])
        }
        if character.first!.unlockperk8 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["death1"])
        }
        if character.first!.unlockperk9 == true {
            tempDeck.append("death2")
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("death2")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("death3")
            tempDeck.append("death4")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("death3")
            tempDeck.append("death4")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("death5")
            tempDeck.append("death5")
        }
        if character.first!.unlockperk14 == true {
            tempDeck.append("death5")
            tempDeck.append("death5")
        }
        return tempDeck
    }
    
    func buildBannerDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["banner1"])
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["banner1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["banner1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["banner2"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["banner2"])
        }
        if character.first!.unlockperk6 == true {
            tempDeck.append("banner3")
        }
        if character.first!.unlockperk7 == true {
            tempDeck.append("banner3")
        }
        if character.first!.unlockperk8 == true {
            tempDeck.append("banner4")
        }
        if character.first!.unlockperk9 == true {
            tempDeck.append("banner4")
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("banner5")
            tempDeck.append("banner5")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("banner5")
            tempDeck.append("banner5")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("banner6")
            tempDeck.append("banner6")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("banner6")
            tempDeck.append("banner6")
        }
        if character.first!.unlockperk14 == true {
            let index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
        }
        return tempDeck
        
    }
    
    func buildDriftDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["0"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["drift1"])
            tempDeck.append("drift1")
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["drift1"])
            tempDeck.append("drift1")
        }
        if character.first!.unlockperk7 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["drift2"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["drift2"])
        }
        if character.first!.unlockperk8 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["drift3"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["drift3"])
        }
        if character.first!.unlockperk9 == true {
            tempDeck.append("drift4")
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("drift5")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("drift5")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("drift6")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("+1")
        }
        if character.first!.unlockperk14 == true {
            tempDeck.append("+1")
        }
        return tempDeck
        
    }
    
    func buildPainDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            let index2 = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index2!)
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            let index2 = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index2!)
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain2"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain3"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain3"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain3"])
        }
        if character.first!.unlockperk8 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
        }
        if character.first!.unlockperk9 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain4"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain4"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pain4"])
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("pain5")
            tempDeck.append("pain5")
            tempDeck.append("pain5")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("pain5")
            tempDeck.append("pain5")
            tempDeck.append("pain5")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("pain6")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("pain6")
        }
        if character.first!.unlockperk14 == true {
            tempDeck.append("+1")
            tempDeck.append("+1")
        }
        return tempDeck
        
    }
    
    func buildTrapDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-2")
            tempDeck.remove(at: index!)
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap2"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap2"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap2"])
        }
        if character.first!.unlockperk7 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap3"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap3"])
        }
        if character.first!.unlockperk8 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap3"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap3"])
        }
        if character.first!.unlockperk9 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap3"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap3"])
        }
        if character.first!.unlockperk10 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap4"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap4"])
        }
        if character.first!.unlockperk11 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap4"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["trap4"])
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("trap5")
            tempDeck.append("trap5")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("trap5")
            tempDeck.append("trap5")
        }
        if character.first!.unlockperk14 == true {
            tempDeck.append("trap5")
            tempDeck.append("trap5")
        }
        return tempDeck
        
    }
    
    func buildShatterDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            var index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
        }
        if character.first!.unlockperk2 == true {
            var index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song1"])
            index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song1"])
        }
        if character.first!.unlockperk3 == true {
            var index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song1"])
            index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song2"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song3"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song3"])
        }
        if character.first!.unlockperk7 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song4"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song4"])
        }
        if character.first!.unlockperk8 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song4"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["song4"])
        }
        if character.first!.unlockperk9 == true {
            tempDeck.append("song5")
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("song5")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("song6")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("song6")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("song6")
        }
        
        return tempDeck
        
    }
    
    func buildPyroDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            var index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-2")
            tempDeck.remove(at: index!)
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro1"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro2"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro2"])
        }
        if character.first!.unlockperk7 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro3"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro3"])
        }
        if character.first!.unlockperk8 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro3"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["pyro3"])
        }
        if character.first!.unlockperk9 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("pyro4")
            tempDeck.append("pyro4")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("pyro4")
            tempDeck.append("pyro4")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("pyro5")
            tempDeck.append("pyro5")
        }
        
        return tempDeck
        
    }
    
    func buildCrashDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            tempDeck.append("crash1")
            tempDeck.append("crash1")
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            tempDeck.append("crash1")
            tempDeck.append("crash1")
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            tempDeck.append("crash2")
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            tempDeck.append("crash2")
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            tempDeck.append("crash3")
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            tempDeck.append("crash3")
        }
        if character.first!.unlockperk7 == true {
            tempDeck.append("crash4")
            tempDeck.append("crash4")
        }
        if character.first!.unlockperk8 == true {
            tempDeck.append("crash4")
            tempDeck.append("crash4")
        }
        if character.first!.unlockperk9 == true {
            tempDeck.append("crash5")
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("crash5")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("crash6")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("crash7")
            tempDeck.append("crash7")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("crash7")
            tempDeck.append("crash7")
        }
        return tempDeck
        
    }
    
    func buildDeepDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            var index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "-1")
            tempDeck.remove(at: index!)
            
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep2"])
        }
        
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            tempDeck.append("deep3")
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            tempDeck.append("deep3")
        }
        if character.first!.unlockperk7 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep4"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep4"])
        }
        if character.first!.unlockperk8 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
        }
        if character.first!.unlockperk9 == true {
            var index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep5"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep5"])
            index = tempDeck.firstIndex(of: "+1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["deep5"])
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("deep6")
            tempDeck.append("deep6")
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("deep6")
            tempDeck.append("deep6")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("deep6")
            tempDeck.append("deep6")
        }
        if character.first!.unlockperk13 == true {
            var index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "0")
            tempDeck.remove(at: index!)
        }
        return tempDeck
        
    }
    
    func buildMetalDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal1"])
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal2"])
        }
        
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal2"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal3"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal3"])
        }
        if character.first!.unlockperk8 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal4"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal5"])
        }
        if character.first!.unlockperk9 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal4"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["metal5"])
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("metal6")
            
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("metal6")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("metal+3")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("+1")
            tempDeck.append("+1")
        }
        return tempDeck
        
    }
    
    func buildHiveDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            var index = tempDeck.firstIndex(of: "-2")
            tempDeck.remove(at: index!)
            index = tempDeck.firstIndex(of: "+1")
            tempDeck.remove(at: index!)
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["hive1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["hive1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["hive1"])
        }
        
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["hive2"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["hive2"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["hive2"])
        }
        if character.first!.unlockperk8 == true {
            tempDeck.append("hive3")
        }
        if character.first!.unlockperk9 == true {
            tempDeck.append("hive3")
        }
        if character.first!.unlockperk10 == true {
            tempDeck.append("hive3")
            
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("hive4")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("hive4")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("hive5")
            tempDeck.append("hive5")
        }
        if character.first!.unlockperk14 == true {
            tempDeck.append("hive6")
            tempDeck.append("hive6")
        }
        return tempDeck
        
    }
    
    func buildFistDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist1"])
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["0"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist2"])
        }
        if character.first!.unlockperk6 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist2"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist3"])
        }
        if character.first!.unlockperk8 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist3"])
        }
        if character.first!.unlockperk9 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist4"])
        }
        if character.first!.unlockperk10 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["fist4"])
        }
        if character.first!.unlockperk11 == true {
            tempDeck.append("fist+3")
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("fist5")
            tempDeck.append("fist5")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("fist5")
            tempDeck.append("fist5")
        }
        if character.first!.unlockperk14 == true {
            tempDeck.append("fist5")
            tempDeck.append("fist5")
        }
        return tempDeck
        
    }
    
    func buildInfuserDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-2") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser1"])
            tempDeck.append("-1")
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser2"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser2"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser3"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser3"])
        }
        if character.first!.unlockperk6 == true {
            if character.first!.unlockperk5 && character.first!.unlockperk4 && character.first!.unlockperk7 && character.first!.unlockperk3 && character.first!.unlockperk2 && !character.first!.unlockperk1 {
                tempDeck.append("-1")
                InfuserAlert = true
            }
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser4"])
        }
        if character.first!.unlockperk7 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser4"])
        }
        if character.first!.unlockperk8 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
        }
        if character.first!.unlockperk9 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["+2"])
        }
        if character.first!.unlockperk10 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser5"])
        }
        if character.first!.unlockperk11 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["infuser5"])
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("infuser6")
            tempDeck.append("infuser6")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("infuser6")
            tempDeck.append("infuser6")
        }
        return tempDeck
        
    }
    
    func buildSnowDeck() -> [String] {
        var tempDeck = ["-2", "-1", "-1", "-1", "-1", "-1", "0", "0", "0", "0", "0", "0", "+1", "+1", "+1", "+1", "+1", "+2", "x0", "x2"]
        if character.first!.unlockperk1 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow1"])
        }
        if character.first!.unlockperk2 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow1"])
        }
        if character.first!.unlockperk3 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow1"])
        }
        if character.first!.unlockperk4 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow2"])
        }
        if character.first!.unlockperk5 == true {
            let index = tempDeck.firstIndex(of: "-1") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow2"])
        }
        if character.first!.unlockperk6 == true {
            tempDeck.append("snow3")
            tempDeck.append("snow3")
        }
        if character.first!.unlockperk7 == true {
            tempDeck.append("snow3")
            tempDeck.append("snow3")
        }
        if character.first!.unlockperk8 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow4"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow4"])
        }
        if character.first!.unlockperk9 == true {
            var index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow4"])
            index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow4"])
        }
        if character.first!.unlockperk10 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow5"])
        }
        if character.first!.unlockperk11 == true {
            let index = tempDeck.firstIndex(of: "0") ?? -1
            tempDeck.replaceSubrange(index ... index, with: ["snow5"])
        }
        if character.first!.unlockperk12 == true {
            tempDeck.append("snow6")
        }
        if character.first!.unlockperk13 == true {
            tempDeck.append("snow6")
        }
        return tempDeck
        
    }
    
    
    var body: some View {
        
        ZStack{
            mainBackgroundGradient.ignoresSafeArea()
            VStack{
                VStack{
                    if showCards {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 10) {
                            ForEach(allCards.indices, id: \.self) { index in
                                VStack {
                                    Image(allCards[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 53)
                                        .clipShape(Rectangle())
                                        .shadow(radius: 3)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .background(tileColor)
                .cornerRadius(10)
                .padding()
                .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
            }
            .alert(isPresented: $InfuserAlert) {
                Alert(
                    title: Text("Infuser Perk Error:"),
                    message: Text("The Infuser has a weird perk issue where if you select perks 2-7 but not perk 1, you are removing more -1 cards than you have in your deck. You should check your perks!" )
                )}
        }
        .onAppear{
            self.allCards = getAllCards()
            
            showCards = true
            
        }
    }
        
    
}

