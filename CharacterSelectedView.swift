//
//  CharacterSelectedView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//
import EffectsLibrary
import CoreData
import SwiftUI

struct CustomColor {
    static let darkGray = Color("darkGray")
    static let tanish = Color("tanish")
    static let blueish = Color("blueish")
    static let darkBrown = Color("darkBrown")
    static let darkGreen = Color("darkGreen")
    static let blue2 = Color("blue2")
    static let otherGray = Color("otherGray")
}

let color1: UIColor = UIColor(named: "Color1") ?? .white

private var fontColor: Color{.white}
private var tileColor: Color{CustomColor.otherGray}
private var borderColor: Color{CustomColor.blueish}
private var titleColor: Color{CustomColor.blueish}

struct CharacterSelectedView: View {
    @State private var selectedTab = 1
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    var characterId: UUID
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest var character: FetchedResults<Character>
    @State private var showLevelUp = false
    let levels =  [ "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let xpNeeded = ["0", "45", "95", "150", "210", "275", "345", "420", "500"]
    
    
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
                checkCounter()
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
    
    var level2alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level2alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level2alerted = newValue
                try? moc.save()
            }
        )
    }
    
    var level3alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level3alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level3alerted = newValue
                try? moc.save()
            }
        )
    }
    
    var level4alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level4alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level4alerted = newValue
                try? moc.save()
            }
        )
    }
    
    var level5alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level5alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level5alerted = newValue
                try? moc.save()
            }
        )
    }
    
    var level6alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level6alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level6alerted = newValue
                try? moc.save()
            }
        )
    }
    
    var level7alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level7alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level7alerted = newValue
                try? moc.save()
            }
        )
    }
    
    var level8alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level8alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level8alerted = newValue
                try? moc.save()
            }
        )
    }
    
    var level9alerted: Binding<Bool> {
        Binding(
            get: {character.first!.level9alerted},
            set: {newValue in
                guard let character = character.first else { return }
                character.level9alerted = newValue
                try? moc.save()
            }
        )
    }

    var characteristics: [String] {
        guard let playableClass = character.first?.playableClass else { return [] }
        return charDict[playableClass] ?? []
    }
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            NavigationStack{
                ScrollView{
                    ZStack{
                        mainBackgroundGradient.ignoresSafeArea()
                        VStack{
                            VStack{
                                headerView
                                Divider()
                                    .foregroundColor(fontColor)
                                    .bold()
                                LevelsView
                            }
                            .background(tileColor)
                            .cornerRadius(10)
                            .padding()
                            .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                            VStack{
                                StatsView(playableClass: (character.first?.playableClass)!, level: level, xp:xp, gold:gold, health:health )
                            }
                            .background(tileColor)
                            .cornerRadius(10)
                            .padding()
                            .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                                
                            VStack{
                                PerkPointView(characterId: characterId)
                                Divider()
                                    .bold()
                                    .foregroundColor(fontColor)
                            }
                            .background(tileColor)
                            .cornerRadius(10)
                            .padding()
                            .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                            VStack{
                                MasteryGoalsView(characterId: characterId)
                                Divider()
                                    .bold()
                                    .foregroundColor(fontColor)
                            }
                            .background(tileColor)
                            .cornerRadius(10)
                            .padding()
                            .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                            VStack{
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
                                case "frozenfist":
                                    FrozenFistPerkyView(characterId: characterId)
                                case "hive":
                                    HivePerkyView(characterId: characterId)
                                case "metalmosaic":
                                    MetalMosaicPerkyView(characterId: characterId)
                                case "deepwraith":
                                    DeepwraithPerkyView(characterId: characterId)
                                case "crashingtide":
                                    CrashingTidePerkyView(characterId: characterId)
                                case "infuser":
                                    InfuserPerkyView(characterId: characterId)
                                case "pyroclast":
                                    PyroclastPerkyView(characterId: characterId)
                                case "shattersong":
                                    ShattersongPerkyView(characterId: characterId)
                                case "trapper":
                                    TrapperPerkyView(characterId: characterId)
                                case "painconduit":
                                    PainConduitPerkyView(characterId: characterId)
                                case "snowdancer":
                                    SnowdancerPerkyView(characterId: characterId)
                                default:
                                    Text("ERROR")
                                }
                            }
                            .background(tileColor)
                            .cornerRadius(10)
                            .padding()
                            .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                        }
                        if showLevelUp {
                            FireworksView()
                        }
                    }
                }
                
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle.portrait")
                Text("Character Sheet")
            }
            .tag(1)
            GameView(characterId: characterId)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game Mode")
                }
                .tag(2)
            
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
                ScrollView{
                    VStack{
                        ResourceTrackerView(axenut: axenut, lumber: lumber, metal: metal, hide: hide, arrowvine: arrowvine, corpsecap: corpsecap, flamefruit: flamefruit, rockroot: rockroot, snowthistle: snowthistle)
                    }
                    .background(tileColor)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                    
                    VStack{
                        CharacterInventoryView(characterId: characterId)
                    }
                    .background(tileColor)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y:5)
                }
            }
            
            .tabItem {
                Image(systemName: "backpack")
                Text("Inventory")
            }
            .tag(3)
            
            DeckView(characterId: characterId)
            
            
                .tabItem {
                    Image(systemName: "square.stack")
                    Text("Deck")
                }
                .tag(4)
            
            NoteView(characterId: characterId)
            
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("Notes")
                }
                .tag(5)
        }
        .onChange(of: selectedTab) { newValue in
            if newValue == 1 {
                checkCounter()
                updateHealth()
            }
            
        }
    }
    
    func updateHealth() {
        //This is a fix for the stupid pain conduit health issue
        if character.first!.playableClass == "painconduit" && character.first!.unlockperk18 && character.first!.unlockperk17 {
            let newHealth = getHealth(level: character.first!.level, playableClass: character.first!.playableClass!) + 5
            do {
                
                character.first!.health = newHealth
                try moc.save()
            }
            catch{
                print("error saving")
            }
        } else {
            let newHealth = getHealth(level: character.first!.level, playableClass: character.first!.playableClass!)
            do {
                
                character.first!.health = newHealth
                try moc.save()
            }
            catch{
                print("error saving")
            }
        }

    }
    
    func checkCounter() {
        switch xp.wrappedValue {
        case 45..<95:
            if level2alerted.wrappedValue == false{
                showAlert()
                level2alerted.wrappedValue = true
            }
        case 95..<150:
            if level3alerted.wrappedValue == false{
                showAlert()
                level3alerted.wrappedValue = true
            }
        case 150..<210:
            if level4alerted.wrappedValue == false{
                showAlert()
                level4alerted.wrappedValue = true
            }
        case 210..<275:
            if level5alerted.wrappedValue == false{
                showAlert()
                level5alerted.wrappedValue = true
            }
        case 275..<345:
            if level6alerted.wrappedValue == false{
                showAlert()
                level6alerted.wrappedValue = true
            }
        case 345..<420:
            if level7alerted.wrappedValue == false{
                showAlert()
                level7alerted.wrappedValue = true
            }
        case 420..<500:
            if level8alerted.wrappedValue == false{
                showAlert()
                level8alerted.wrappedValue = true
            }
        case 500..<501:
            if level9alerted.wrappedValue == false{
                showAlert()
                level9alerted.wrappedValue = true
            }
        default:
            return
        }
    }
    
    func showAlert() {
        showLevelUp = true
        let charlevel = character.first!.level
        let newlevel = charlevel + 1
        let charunlocks = character.first!.cardUnlocks
        let newunlocks = charunlocks + 1
        
        if character.first!.playableClass == "painconduit" && character.first!.unlockperk18 && character.first!.unlockperk17 {
            let newHealth = getHealth(level: newlevel, playableClass: character.first!.playableClass!) + 5
            do {
                character.first!.level = newlevel
                character.first!.cardUnlocks = newunlocks
                character.first!.health = newHealth
                try moc.save()
            }
            catch{
                print("error saving")
            }
        } else {
            let newHealth = getHealth(level: newlevel, playableClass: character.first!.playableClass!)
            do {
                character.first!.level = newlevel
                character.first!.cardUnlocks = newunlocks
                character.first!.health = newHealth
                try moc.save()
            }
            catch{
                print("error saving")
            }
        }
    }
    
    func updatelevel() {
        
    }
    
    private var headerView: some View{
        VStack{
            HStack(alignment: .top){
                Image("\(character.first?.logo ?? "")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 90)
                    .clipShape(Rectangle())
                    .shadow(radius: 5)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text("\(character.first?.name ?? "")")
                        .font(.title)
                        .foregroundColor(titleColor)
                        .fontWeight(.bold)
                        .frame(width: 220.0)
                    
                    Text("The")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(titleColor)
                        .multilineTextAlignment(.center)
                        .frame(width: 220.0)
                    
                    Text("\(character.first?.displayClass ?? "")")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 220.0)
                        .foregroundColor(titleColor)
                }
            }
            Divider()
            HStack{
                
                ForEach(0 ..< characteristics.count, id: \.self) { x in
                    HStack{
                        Text("\(characteristics[x])")
                            .foregroundColor(titleColor)
                            .padding([.top, .leading])
                    }
                }
                
            }
        }.padding()
        
    }
    

    private var LevelsView : some View{
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
                                .fill(xp.wrappedValue >= Int(xpNeeded[index])! ? Color.green : Color.gray)
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
            .padding(.bottom)
            .alert(isPresented: $showLevelUp) {
                Alert(
                    title: Text("Congratulations!"),
                    message: Text("You have reached the next level! Dont forget to pick a perk and unlock a new card!" ),
                    dismissButton: .default(Text("Awesome!"))
                )
            }
        
    }
    
}





struct StatsView: View {
    var playableClass : String
    @Binding var level: Int16
    @Binding var xp: Int16
    @Binding var gold: Int16
    @Binding var health: Int16
    
    var body: some View{
       
        VStack{
            Text("Stats:")
                .font(.title3)
                .bold()
                .foregroundColor(titleColor)
            Divider()
                .bold()
                .foregroundColor(titleColor)
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
                .foregroundColor(titleColor)
            Grid(alignment: .leading) {
                GridRow{
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                    Text("XP: ")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("\(xp)")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
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
                    Text("\(gold)")
                        .font(.headline)
                        .foregroundColor(Color.yellow)
                        .brightness(0.2)
                        .opacity(0.8)
                    Stepper(value: $gold, in: 0...9999, step: 1) {
                        Text("")
                    }
                    .foregroundColor(.red)
                    
                }
            }
            .padding(.bottom)
        }.padding([.top, .leading, .trailing])
    }
    
    func getHealth(level: Int16, playableClass: String) -> Int16 {
            return (healthDict[playableClass]?[Int16(level)])!
        }
}
