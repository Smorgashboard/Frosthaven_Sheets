//
//  GameView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI
import CoreData

struct GameView: View {
    var characterId: UUID
    private var fontColor: Color{.white}
    private var tileColor: Color{CustomColor.otherGray}
    private var borderColor: Color{CustomColor.blueish}
    private var titleColor: Color{CustomColor.blueish}
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest var character: FetchedResults<Character>
    
    init(characterId: UUID) {
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._character = FetchRequest(fetchRequest: request)
        
    }
   
    var xp: Binding<Int16> {
        Binding(
            get: { character.first?.xp ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.xp = newValue
                try? moc.save()
            }
        )
    }
    
    var health: Binding<Int16> {
        Binding(
            get: { character.first?.health ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.health = newValue
                try? moc.save()
            }
        )
    }
    
    var gold: Binding<Int16> {
        Binding(
            get: { character.first?.gold ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.gold = newValue
                try? moc.save()
            }
        )
    }
    
    var level: Binding<Int16> {
        Binding(
            get: { character.first?.level ?? 1},
            set: { newValue in
                guard let character = character.first else { return }
                character.level = newValue
                try? moc.save()
            }
        )
    }
    
    var body: some View {
        let charItems : [Int] = character.first!.inventoryItems!
        
        let filteredItems = items.filter { item in
            charItems.contains(item.number)
        }
        
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
                ScrollView{
                VStack{
                    VStack{
                        Divider()
                        Text("Battle Goal:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(titleColor)
                            .multilineTextAlignment(.center)
                        BattleGoalsView(characterId: characterId)
                    }
                    //.background(tileColor)
                    //.cornerRadius(10)
                    //.padding(.horizontal)
                    //.shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                        VStack{
                            Text("Stats:")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(titleColor)
                                .multilineTextAlignment(.center)
                                .padding(.vertical)
                            HStack{
                                
                                Text("Health: \n\(health.wrappedValue)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.center)
                                    .padding(.leading)
                                Stepper(value: health, in: 0...50, step: 1) {
                                    Text("")
                                }
                                Divider()
                                
                                Text("XP: \n\(xp.wrappedValue)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                    .multilineTextAlignment(.center)
                                Stepper(value: xp, in: 0...500, step: 1) {
                                    Text("")
                                }.padding(.trailing)
                            }
                            HStack{
                                Text("Gold: \(gold.wrappedValue)")
                                    .font(.headline)
                                    .foregroundColor(Color.yellow)
                                    .brightness(0.2)
                                    .opacity(0.8)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Stepper(value: gold, in: 0...9999, step: 1) {
                                    Text("")
                                }.padding(.trailing)
                            }
                            .frame(height:35)
                            Divider()
                        }
                        .background(tileColor)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                        VStack{
                            Text("Your Items:")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(titleColor)
                                .multilineTextAlignment(.center)
                                .padding(.vertical)
                            Divider()
                            ForEach(filteredItems){ item in
                                HStack{
                                    Text("\(item.name) :")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                        .padding(.leading)
                                    Spacer()
                                    switch item.type{
                                    case "boots":
                                        Image("BootsLogo_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                    case "chest":
                                        Image("ChestLogo_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                    case "1 hand" :
                                        Image("1HandLogo_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                    case "2 hand" :
                                        Image("2HandLogo_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                    case "helmet":
                                        Image("HelmetLogo_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                    case "potion" :
                                        Image("PotionLogo_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                    default:
                                        Text("\(item.type)")
                                    }
                                    
                                    switch item.use{
                                    case "tap":
                                        Image("TapIcon_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                           
                                        tapToggleView(tapWord: "Tapped")
                                    case "lost":
                                        Image("LostIcon_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                        lostToggleView(lostWord: "Lost")
                                    case "flip":
                                        Image("FlipIcon_White")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 25)
                                            .clipShape(Rectangle())
                                            .shadow(radius: 5)
                                            
                                        flipToggleView(flipWord: "Flipped")
                                    case "perm":
                                        Text("")
                                    default:
                                        Text("\(item.use)")
                                    }
                                }
                                HStack{
                                    Text("\(item.description)")
                                        .padding(.horizontal)
                                }
                                Divider()
                            }
                            
                            
                        }
                        .background(tileColor)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                        VStack{
                                Text("Attack Deck:")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(titleColor)
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical)
                                AttackDeckView(characterId: characterId)
                            
                            Divider()
                        }
                        .background(tileColor)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                    
                }
                
            }
        }
    }
    
}


struct flipToggleView: View {
    
    var flipWord: String
    @State private var wordToggle = false
    
    var body: some View {
            Toggle(flipWord, isOn: $wordToggle)
            .padding(.trailing)
        }
}

struct tapToggleView: View {
    
    var tapWord: String
    @State private var wordToggle = false
    
    var body: some View {
            Toggle(tapWord, isOn: $wordToggle)
            .padding(.trailing)
        }
    
}

struct lostToggleView: View {
    
    var lostWord: String
    @State private var wordToggle = false
    
    var body: some View {
            Toggle(lostWord, isOn: $wordToggle)
            .padding(.trailing)
        }
}
