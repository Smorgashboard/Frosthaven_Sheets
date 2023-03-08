//
//  MainScreenView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI

let mainBackgroundGradient = LinearGradient(
    gradient: Gradient(colors: [Color.blue, Color.cyan, Color.white]),
    startPoint: .top, endPoint: .bottom)

struct MainScreenView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Character.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Character.name, ascending: true)]) var characters: FetchedResults<Character>
    @State private var isShowingDeleteConfirmation = false
    @State private var characterToDelete: Character?
    
    var body: some View {
        NavigationStack {
            ZStack{
                mainBackgroundGradient
                    .ignoresSafeArea()
                VStack{
                    List{
                        ForEach(characters, id: \.self) { character in
                            NavigationLink(destination: CharacterSelectedView(characterId: character.id!)){
                                Text(character.name!)
                            }
                            .navigationBarTitle(Text("Characters"), displayMode: .inline)
                        }
                        .onDelete(perform: {indexSet in
                            isShowingDeleteConfirmation = true
                            characterToDelete = characters[indexSet.first!]
                        })
                        Spacer()
                        NavigationLink(destination: CharacterCreationView()) {
                            Text("Create New Character")
                        }
                        .navigationBarTitle(Text("Characters"), displayMode: .inline)
                        NavigationLink(destination: InventoryStoreView()){
                            Text("Invetory")
                        }
                    }
                    .navigationTitle("Characters")
                    .alert(isPresented: $isShowingDeleteConfirmation) {
                        Alert(
                            title: Text("Delete character"),
                            message: Text("Are you sure you want to delete \(characterToDelete?.name ?? "")? This cannot be undone!" ),
                            primaryButton: .destructive(Text("Delete")) {
                                deleteCharacter(at: IndexSet(integer: self.characters.firstIndex(of: self.characterToDelete!)!))
                            },
                            secondaryButton: .cancel()
                        )
                    }
   
                }
            }.preferredColorScheme(.dark)
        }
    }
    
    func deleteCharacter(at offsets: IndexSet) {
        for index in offsets {
            let character = characters[index]
            moc.delete(character)
        }
        do {
            try moc.save()
        } catch {
            print("Error saving context after deleting character: \(error.localizedDescription)")
        }
    }
}


struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
