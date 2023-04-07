//
//  NotesView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 4/7/23.
//

import SwiftUI
import CoreData

struct NoteView: View {
    @Environment(\.managedObjectContext) var moc
    var characterId: UUID
    @FetchRequest var characters: FetchedResults<Character>
    private var accentColor: Color{.white}
    private var titleColor: Color{CustomColor.blueish}
    private var tileColor: Color{CustomColor.otherGray}
    private var borderColor: Color{CustomColor.blueish}
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    init(characterId: UUID){
        self.characterId = characterId
        
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", characterId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Character.name, ascending: true)]
        request.fetchLimit = 1
        
        self._characters = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        
        let retirement = characters.first!.retirementGoal ?? "None"
        let retirementText = retirementGoals[retirement] ?? ("","","")
        
        ZStack{
            mainBackgroundGradient.ignoresSafeArea()
            ScrollView{
                VStack {
                    VStack {
                        Text("Notes")
                            .font(.title)
                            .padding(.vertical)
                            .foregroundColor(titleColor)
                            .bold()
                        Divider()
                            .bold()
                            .foregroundColor(titleColor)
                        TextEditor(text: Binding(
                            get: { characters.first?.notes as? String ?? "" },
                            set: { newValue in
                                characters.first?.notes = newValue
                                saveContext()
                            }
                        ))
                        .frame(minHeight: 4 * UIFont.preferredFont(forTextStyle: .body).lineHeight)
                        .padding()
                    }
                    .background(tileColor)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y: 5)
                    
                    VStack {
                        Text("Counters")
                            .font(.title)
                            .bold()
                            .padding(.vertical)
                            .foregroundColor(titleColor)
                        Divider()
                            .bold()
                            .foregroundColor(titleColor)
                        ForEach(0..<4) { index in
                            HStack {
                                TextField("Change Me", text: Binding(
                                    get: { characters.first?.value(forKey: "counter\(index + 1)Name") as? String ?? "" },
                                    set: { newValue in
                                        characters.first?.setValue(newValue, forKey: "counter\(index + 1)Name")
                                        saveContext()
                                    }
                                ))
                                .padding(.all)
                                .background(Color.clear)
                                
                                Stepper(value: Binding(
                                    get: { Int16(Int(characters.first?.value(forKey: "counter\(index + 1)") as? Int16 ?? 0)) },
                                    set: { newValue in
                                        characters.first?.setValue(Int16(newValue), forKey: "counter\(index + 1)")
                                        saveContext()
                                    }
                                ), in: 0...Int16.max) {
                                    Text("\(Int(characters.first?.value(forKey: "counter\(index + 1)") as? Int16 ?? 0))")
                                        .padding(.all)
                                }.padding(.trailing)
                            }
                        }
                    }
                    .background(tileColor)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y: 5)
                    VStack{
                        Text("Retirment Goal")
                            .font(.title)
                            .bold()
                            .padding(.vertical)
                            .foregroundColor(titleColor)
                        Divider()
                            .bold()
                            .foregroundColor(titleColor)
                        Text("\(retirement)")
                            .font(.title3)
                            .padding(.vertical)
                            .bold()
                        Divider()
                        Text("\(retirementText.0)")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .padding(.vertical)
                        Text("\(retirementText.1)")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .padding(.vertical)
                        Text("\(retirementText.2)")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .padding(.vertical)
                    }
                    .background(tileColor)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: borderColor.opacity(0.3), radius: 5, x: 5, y: 5)
                    
                }
                .padding()
            }
        }
    }
    
    private func saveContext() {
        do {
            try moc.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

