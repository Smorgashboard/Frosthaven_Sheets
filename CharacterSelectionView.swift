//
//  MainScreenView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI


struct CharacterSelectionView: View {
    
    @EnvironmentObject private var purchaseManager: PurchaseManager
    @EnvironmentObject var settings: Settings
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Character.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Character.name, ascending: true)]) var characters: FetchedResults<Character>
    @State private var isShowingDeleteConfirmation = false
    @State private var characterToDelete: Character?
    
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationStack {
            ZStack{
                mainBackgroundGradient
                    .ignoresSafeArea()
                VStack{
                    List{
                        Text("Your Characters:")
                            .font(.title2)
                            .bold()
                        ForEach(characters, id: \.self) { character in
                            NavigationLink(destination: CharacterSelectedView(characterId: character.id!)){
                                HStack{
                                    Text(character.name!)
                                    Spacer()
                                    Image(character.logo!)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 25, maxHeight: 25)
                                }
                            }
                            .foregroundColor(.blue)
                            .preferredColorScheme(.dark)
                        }
                        .onDelete(perform: {indexSet in
                            isShowingDeleteConfirmation = true
                            characterToDelete = characters[indexSet.first!]
                        })
                        
                    }
                    .scrollContentBackground(Visibility.hidden)
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
                    VStack{
                        if !purchaseManager.hasUnlockedChars {
                            NavigationLink(destination: UnlockAllCharsView()){
                                Text("Unlock All Classes")
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: 40)
                            }
                            .background(Color.black)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                            .padding([.leading, .bottom, .trailing])
                        }
                        NavigationLink(destination: CharacterCreationView()) {
                            Text("Create New Character")
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 40)
                        }
                        .background(Color.black)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    Spacer()
                    
                }
            }
            .background(mainBackgroundGradient.ignoresSafeArea())
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
        CharacterSelectionView()
    }
}
