//
//  CharacterSelectedView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//
import CoreData
import SwiftUI

let backgroundGradient = LinearGradient(
    gradient: Gradient(colors: [Color.blue, Color.cyan, Color.white]),
    startPoint: .top, endPoint: .bottom)

let color1: UIColor = UIColor(named: "Color1") ?? .white

struct CharacterSelectedView: View {
    
    var characterId: UUID
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest var character: FetchedResults<Character>
    
    static var  accentColor: Color{.green}
    
    init(characterId: UUID) {
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._character = FetchRequest(fetchRequest: request)
        
    }
    
    var lumber: Binding<Int16> {
        Binding(
            get: { character.first?.lumber ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.lumber = newValue
                try? moc.save()
            }
        )
    }
    
    var metal: Binding<Int16> {
        Binding(
            get: { character.first?.metal ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.metal = newValue
                try? moc.save()
            }
        )
    }
    
    var hide: Binding<Int16> {
        Binding(
            get: { character.first?.hide ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.hide = newValue
                try? moc.save()
            }
        )
    }
    
    var arrowvine: Binding<Int16> {
        Binding(
            get: { character.first?.arrowvine ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.arrowvine = newValue
                try? moc.save()
            }
        )
    }
    
    var axenut: Binding<Int16> {
        Binding(
            get: { character.first?.axenut ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.axenut = newValue
                try? moc.save()
            }
        )
    }
    
    var corpsecap: Binding<Int16> {
        Binding(
            get: { character.first?.corpsecap ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.corpsecap = newValue
                try? moc.save()
            }
        )
    }
    
    var flamefruit: Binding<Int16> {
        Binding(
            get: { character.first?.flamefruit ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.flamefruit = newValue
                try? moc.save()
            }
        )
    }
    
    var rockroot: Binding<Int16> {
        Binding(
            get: { character.first?.rockroot ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.rockroot = newValue
                try? moc.save()
            }
        )
    }
    
    var snowthistle: Binding<Int16> {
        Binding(
            get: { character.first?.snowthistle ?? 0 },
            set: { newValue in
                guard let character = character.first else { return }
                character.snowthistle = newValue
                try? moc.save()
            }
        )
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
    
    
    //Why is this here?
    var perks: [Int: (String, Int, Int)] {
        perkDict[character.first?.playableClass ?? ""] ?? [:]
    }
    @State private var multiSelection = Set<UUID>()
    @State private var selectedImage = ""
    @State private var levelExpanded: [String: Bool] = [:]
    @State private var isHovered = false
    @State private var isExpanded = false
    @State private var currentDeck: [String] = []
    @State var isDisclosureGroupExpanded: Bool = false
    
    
    
    var body: some View {
        
        TabView {
            NavigationStack{
                ScrollView{
                    ZStack{
                        Color.black.edgesIgnoringSafeArea(.all)
                        VStack{
                            headerView
                            Divider()
                                .accentColor(Color.accentColor)
                            LevelsView(xp: xp)
                            Divider()
                                .overlay(.green)
                            VStack{
                                StatsView(playableClass: (character.first?.playableClass)!, level: level, xp:xp, gold:gold )
                            }.background(Color.clear)
                            Divider()
                                .overlay(.green)
                            VStack{
                                PerkPointView(characterId: characterId)
                                Divider()
                                    .overlay(.green)
                                MasteryGoalsView(characterId: characterId)
                                Divider()
                                switch character.first?.playableClass{
                                case "boneshaper":
                                    BoneshaperPerkyView(characterId: characterId)
                                case "drifter":
                                    DrifterPerkyView(characterId: characterId)
                                case "bannerspear" :
                                    BannerSpearPerkyView(characterId: characterId)
                                case "geminate" :
                                    GeminatePerkyView(characterId: characterId)
                                case "deathwalker":
                                    DeathwalkerPerkyView(characterId: characterId)
                                case "blinkblade" :
                                    BlinkbladePerkyView(characterId: characterId)
                                default:
                                    Text("ERROR").foregroundColor(.green)
                                }
                            }
                        }
                    }
                }
                
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle.portrait")
                Text("Character Sheet")
            }
            
            GameView(characterId: characterId)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game Mode")
                }
            
                VStack{
                    ScrollView{
                        ResourceTrackerView(axenut: axenut, lumber: lumber, metal: metal, hide: hide, arrowvine: arrowvine, corpsecap: corpsecap, flamefruit: flamefruit, rockroot: rockroot, snowthistle: snowthistle)
                    }
                   
                    
                    CharacterInventoryView(characterId: characterId)
                    
                }
            
                .tabItem {
                    Image(systemName: "backpack")
                    Text("Inventory")
                }

            CharacterInventoryView(characterId: characterId)
            
                .tabItem {
                    Image(systemName: "square.stack")
                    Text("Deck")
                }
        }
    }
    
    
    
    private var headerView: some View{
        HStack(alignment: .top){
            Image("\(character.first?.logo ?? "")")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 90)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                .shadow(radius: 5)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text("\(character.first?.name ?? "")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .frame(width: 220.0)
                
                Text("The")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                    .frame(width: 220.0)
                
                Text("\(character.first?.displayClass ?? "")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .frame(width: 220.0)
            }
        }
        .padding()
    }
    
}




struct LevelsView : View{
    
    @Binding var xp: Int16
    let levels =  [ "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let xpNeeded = ["0", "45", "95", "150", "210", "275", "345", "420", "500"]
    
     var body: some View {
        HStack(spacing: 5) {
            VStack(alignment: .leading){
                Text("Lvl:")
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                Spacer()
                Text("XP:")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            .frame(height:60)
            ForEach(1..<9) { index in
                VStack(alignment: .center) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(xp >= Int(xpNeeded[index])! ? Color.green : Color.gray)
                            .frame(width: 31, height: 20) // Set the width and height of the RoundedRectangle
                        Text("\(index + 1)")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    Spacer()
                    Text(xpNeeded[index])
                        .foregroundColor(.blue)
                }
                .frame(height:60)
            }
        }
    }
}

struct BattleGoalsView: View {
    @State private var selectedKey = "Wallflower"
    @State private var options: [String] = []
    @State private var selectedOption: (String, Int)? = nil
    @State private var showOptions = true
    
    var body: some View {
        VStack {
            if options.isEmpty && showOptions {
                Text("Select A Battle Goal!")
                Button("Start") {
                    options = Array(battleGoals.keys).shuffled().prefix(3).map { $0 }
                }
            } else if showOptions {
                ForEach(options, id: \.self) { option in
                    if let goal = battleGoals[option] {
                        Button(action: {
                            selectedOption = (option, goal.1)
                            showOptions = false
                        }) {
                            VStack {
                                Text(option)
                                    .bold()
                                Text("Goal: \(goal.0), Checkmarks: \(goal.1)")
                                    .bold()
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            } else {
                if let selectedOption = selectedOption, let goal = battleGoals[selectedOption.0] {
                    VStack {
                        Text("Selected Goal: \(selectedOption.0)")
                        Text("Goal: \(goal.0), Checkmarks: \(goal.1)")
                    }
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}



struct StatsView: View {
    var playableClass : String
    @Binding var level: Int16
    @Binding var xp: Int16
    @Binding var gold: Int16
    
    
    var body: some View{
        let health : Int = getHealth(level:level, playableClass: playableClass)
       
            
        VStack(alignment: .center){
            HStack{
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Text("Health: ")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text("\(health)")
                    .foregroundColor(.red)
                    .textFieldStyle(PlainTextFieldStyle())
            }
        }
            Divider()
        Grid(alignment: .leading) {
            GridRow{
                Image(systemName: "star.fill")
                    .foregroundColor(.blue)
                Text("XP: ")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                TextField("", value: $xp, formatter: NumberFormatter(), onCommit: {})
                    .foregroundColor(.blue)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: 50)
                    .multilineTextAlignment(.trailing)
                Stepper(value: $xp, in: 0...500, step: 1) {
                    Text("")
                }
            }
            GridRow{
                Image(systemName: "dollarsign.circle.fill")
                    .foregroundColor(Color.yellow)
                    .brightness(0.2)
                    .opacity(0.8)
                Text("Gold: ")
                    .font(.headline)
                    .foregroundColor(Color.yellow)
                    .brightness(0.2)
                    .opacity(0.8)
                TextField("", value: $gold, formatter: NumberFormatter(), onCommit: {})
                    .foregroundColor(Color.yellow)
                    .brightness(0.2)
                    .opacity(0.8)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: 50)
                    .multilineTextAlignment(.trailing)
                Stepper(value: $gold, in: 0...9999, step: 1) {
                    Text("")
                }
                .foregroundColor(.red)
                
            }
        }
    }
    
    func getHealth(level: Int16, playableClass: String) -> Int {
            return (healthDict[playableClass]?[Int16(level)])!
        }
}
